import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products_app/colors.dart';
import 'package:products_app/product/presentation/products/components/bottomsheet_header.dart';

class FilterBottomsheet extends StatefulWidget {
  const FilterBottomsheet({
    this.filterBy,
    super.key,
  });

  final FilterBy? filterBy;

  @override
  State<FilterBottomsheet> createState() => _FilterBottomsheetState();
}

class _FilterBottomsheetState extends State<FilterBottomsheet> {
  late final TextEditingController _minController;
  late final TextEditingController _maxController;

  bool get _canSearch =>
      _minController.text.isNotEmpty && _maxController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();

    _minController = TextEditingController();
    _maxController = TextEditingController();

    if (widget.filterBy != null) {
      _minController.text = '${widget.filterBy!.minPrice.toInt()}';
      _maxController.text = '${widget.filterBy!.maxPrice.toInt()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 8,
          top: 8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomsheetHeader(
              title: 'Filtri',
              onClose: () {
                context.pop();
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
                padding: const EdgeInsets.fromLTRB(
                  16,
                  14,
                  16,
                  16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fascia di prezzo',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Flexible(
                          child: FilterTextfield(
                            label: 'Minimo',
                            controller: _minController,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                        Container(
                          height: 1,
                          width: 8,
                          color: AppColors.homeIndicator,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                        ),
                        Flexible(
                          child: FilterTextfield(
                            label: 'Massimo',
                            controller: _maxController,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        _minController.clear();
                        _maxController.clear();
                        setState(() {});
                      },
                      child: const Text('Cancella tutto'),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _canSearch
                          ? () {
                              final min = double.tryParse(_minController.text);
                              final max = double.tryParse(_maxController.text);

                              final filterBy = FilterBy(
                                minPrice: min ?? 0,
                                maxPrice: max ?? 0,
                              );

                              context.pop(filterBy);
                            }
                          : null,
                      child: const Text('Mostra risultati'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _minController.dispose();
    _maxController.dispose();
    super.dispose();
  }
}

class FilterTextfield extends StatelessWidget {
  const FilterTextfield({
    required this.label,
    required this.controller,
    this.onChanged,
    super.key,
  });

  final String label;

  final TextEditingController controller;

  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.border,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
    );

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        label: Text(label),
        labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.5,
              color: AppColors.disabledText,
            ),
      ),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
