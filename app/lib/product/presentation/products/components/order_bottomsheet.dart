import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products_app/colors.dart';
import 'package:products_app/product/presentation/products/components/bottomsheet_header.dart';

class OrderBottomsheet extends StatefulWidget {
  const OrderBottomsheet({
    this.sortBy,
    super.key,
  });

  final SortBy? sortBy;

  @override
  State<OrderBottomsheet> createState() => _OrderBottomsheetState();
}

class _OrderBottomsheetState extends State<OrderBottomsheet> {
  SortBy? _sortBy;

  @override
  void initState() {
    super.initState();

    setState(() {
      _sortBy = widget.sortBy;
    });
  }

  void onChanged(SortBy? sortBy) {
    setState(() {
      _sortBy = sortBy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomsheetHeader(
              title: 'Ordina',
              onClose: () {
                context.pop(_sortBy);
              },
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    OrderTile<SortBy>(
                      value: SortBy.sellingPrice(
                        direction: SortDirection.asc,
                      ),
                      groupValue: _sortBy,
                      onChanged: onChanged,
                      title: const Text('Prezzo crescente'),
                    ),
                    Divider(
                      color: AppColors.border,
                    ),
                    OrderTile<SortBy>(
                      value: SortBy.sellingPrice(
                        direction: SortDirection.desc,
                      ),
                      groupValue: _sortBy,
                      onChanged: onChanged,
                      title: const Text('Prezzo decrescente'),
                    ),
                    Divider(
                      color: AppColors.border,
                    ),
                    OrderTile<SortBy>(
                      value: SortBy.text(
                        direction: SortDirection.asc,
                      ),
                      groupValue: _sortBy,
                      onChanged: onChanged,
                      title: const Text('Nome A-Z'),
                    ),
                    Divider(
                      color: AppColors.border,
                    ),
                    OrderTile<SortBy>(
                      value: SortBy.text(
                        direction: SortDirection.desc,
                      ),
                      groupValue: _sortBy,
                      onChanged: onChanged,
                      title: const Text('Nome Z-A'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderTile<T extends Object?> extends StatelessWidget {
  const OrderTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    super.key,
  });

  final T value;

  final T? groupValue;

  final ValueChanged<T?> onChanged;

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onChanged(value),
      child: Row(
        children: [
          Radio<T>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          title,
        ],
      ),
    );
  }
}
