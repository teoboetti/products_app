import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderBottomsheet extends StatefulWidget {
  const OrderBottomsheet({super.key});

  @override
  State<OrderBottomsheet> createState() => _OrderBottomsheetState();
}

class _OrderBottomsheetState extends State<OrderBottomsheet> {
  SortBy? _sortBy;

  void onChanged(SortBy? sortBy) {
    setState(() {
      _sortBy = sortBy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: CloseButton(
              onPressed: () {
                context.pop(_sortBy);
              },
            ),
          ),
          const Text('Ordina'),
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio<SortBy>(
                        value: SortBy.sellingPrice(
                          direction: SortDirection.asc,
                        ),
                        groupValue: _sortBy,
                        onChanged: onChanged,
                      ),
                      const Text('Prezzo crescente'),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Radio<SortBy>(
                        value: SortBy.sellingPrice(
                          direction: SortDirection.desc,
                        ),
                        groupValue: _sortBy,
                        onChanged: onChanged,
                      ),
                      const Text('Prezzo decrescente'),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Radio<SortBy>(
                        value: SortBy.text(
                          direction: SortDirection.asc,
                        ),
                        groupValue: _sortBy,
                        onChanged: onChanged,
                      ),
                      const Text('Nome A-Z'),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Radio<SortBy>(
                        value: SortBy.text(
                          direction: SortDirection.desc,
                        ),
                        groupValue: _sortBy,
                        onChanged: onChanged,
                      ),
                      const Text('Nome Z-A'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
