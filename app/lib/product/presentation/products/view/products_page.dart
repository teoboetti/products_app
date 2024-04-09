import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/generated/assets.gen.dart';
import 'package:products_app/product/domain/entity/product.dart';
import 'package:products_app/product/domain/usecase/get_products.dart';
import 'package:products_app/product/presentation/products/bloc/products_page_bloc.dart';
import 'package:products_app/product/presentation/products/components/empty_search.dart';
import 'package:products_app/product/presentation/products/components/filter_bottomsheet.dart';
import 'package:products_app/product/presentation/products/components/filter_icon_button.dart';
import 'package:products_app/product/presentation/products/components/loading.dart';
import 'package:products_app/product/presentation/products/components/order_bottomsheet.dart';
import 'package:products_app/product/presentation/products/components/product_card.dart';
import 'package:products_app/product/presentation/products/components/product_search_bar.dart';
import 'package:products_app/product/presentation/products/components/start_search.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsPageBloc>(
      create: (context) => ProductsPageBloc(
        getProducts: context.read<GetProducts>(),
      ),
      child: const ProductsView(),
    );
  }
}

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  late final TextEditingController _textEditingController;
  late final ScrollController _scrollController;

  ProductsPageBloc get _pageBloc => context.read<ProductsPageBloc>();

  void _onScroll() {
    if (_pageBloc.hasReachedMax) return;

    if (!_scrollController.hasClients) return;

    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _pageBloc.add(
        ProductsFetchEvent(query: _pageBloc.query),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: BlocConsumer<ProductsPageBloc, ProductsPageState>(
          listener: (context, state) {
            if (state is ProductsPageLoaded && state.error != null) {
              ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.red,
                  content: Text('Oh no, qualcosa e andato storto'),
                ),
              );
            }
          },
          builder: (context, state) {
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).padding.top +
                              kToolbarHeight,
                        ),
                        Text(
                          'Esplora i prodotti',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ProductSearchbar(
                    controller: _textEditingController,
                    onTap: () {
                      final text = _textEditingController.text;

                      if (text.isNotEmpty) {
                        _pageBloc.add(
                          ProductSearchEvent(
                            query: text,
                          ),
                        );
                      }
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        FilterIconButton(
                          text: 'Filtri',
                          icon: Assets.icons.filter.svg(),
                          onPressed: () async {
                            final filterBy =
                                await showModalBottomSheet<FilterBy?>(
                              isScrollControlled: true,
                              isDismissible: false,
                              enableDrag: false,
                              context: context,
                              builder: (_) => FilterBottomsheet(
                                filterBy: _pageBloc.filterBy,
                              ),
                            );

                            if (filterBy != null) {
                              _pageBloc.add(
                                ProductsSortByEvent(
                                  query: _pageBloc.query,
                                  filterBy: filterBy,
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(width: 8),
                        FilterIconButton(
                          icon: Assets.icons.order.svg(),
                          text: 'Ordina',
                          onPressed: () async {
                            final sortBy = await showModalBottomSheet<SortBy?>(
                              isDismissible: false,
                              enableDrag: false,
                              context: context,
                              builder: (_) => OrderBottomsheet(
                                sortBy: _pageBloc.sortBy,
                              ),
                            );

                            if (sortBy != null) {
                              _pageBloc.add(
                                ProductsSortByEvent(
                                  query: _pageBloc.query,
                                  sortBy: sortBy,
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                if (state is ProductsPageInitial)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: StartSearch(),
                  ),
                if (state is ProductsPageLoading)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Loading(),
                  ),
                if (state is ProductsPageEmptySearch)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: EmptySearch(),
                  ),
                if (state is ProductsPageLoaded)
                  ProductsContent(
                    products: state.products,
                    isLoadingMore: state.isLoadingMore,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}

class ProductsContent extends StatelessWidget {
  const ProductsContent({
    required this.products,
    this.isLoadingMore = false,
    super.key,
  });

  final List<Product> products;

  final bool isLoadingMore;

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            // TODO(teo): get dynamically for now hardcoded
            childAspectRatio: 0.46,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];

            return ProductCard(product: product);
          },
        ),
        if (isLoadingMore)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Loading(),
            ),
          ),
      ],
    );
  }
}
