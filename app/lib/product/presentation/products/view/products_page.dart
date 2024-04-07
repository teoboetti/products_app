import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/product/domain/entity/product.dart';
import 'package:products_app/product/domain/usecase/get_products.dart';
import 'package:products_app/product/presentation/products/bloc/products_page_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsPageBloc>(
      create: (context) => ProductsPageBloc(
        getProducts: context.read<GetProducts>(),
      )..add(
          const ProductsFetchEvent(
            query: 'nike',
          ),
        ),
      child: const ProductsView(),
    );
  }
}

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
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
            switch (state) {
              case ProductsPageInitial():
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case ProductsPageLoaded():
                return ProductsContent(
                  products: state.products,
                  isLoadingMore: state.isLoadingMore,
                  reachedMax: state.reachedMax,
                );
            }
          },
        ),
      ),
    );
  }
}

class ProductsContent extends StatefulWidget {
  const ProductsContent({
    required this.products,
    this.isLoadingMore = false,
    this.reachedMax = false,
    super.key,
  });

  final List<Product> products;

  final bool isLoadingMore;

  final bool reachedMax;

  @override
  State<ProductsContent> createState() => _ProductsContentState();
}

class _ProductsContentState extends State<ProductsContent> {
  late final ScrollController _scrollController;

  void _onScroll() {
    if (widget.reachedMax) return;

    if (!_scrollController.hasClients) return;

    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      final bloc = context.read<ProductsPageBloc>();

      bloc.add(
        ProductsFetchEvent(query: bloc.query),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            // TODO(teo): get dynamically for now hardcoded
            childAspectRatio: 0.46,
          ),
          itemCount: widget.products.length,
          itemBuilder: (context, index) {
            final product = widget.products[index];

            return Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  margin: EdgeInsets.zero,
                  child: AspectRatio(
                    aspectRatio: 164 / 195,
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        product.merchant,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${product.fomattedSellingPrice} or',
                      ),
                      const Text('3 installments of'),
                      Text(
                        product.singleInstallment,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        if (widget.isLoadingMore)
          const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: CircularProgressIndicator(),
              ),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}
