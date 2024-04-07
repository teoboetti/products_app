import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FilterBottomsheet extends StatefulWidget {
  const FilterBottomsheet({super.key});

  @override
  State<FilterBottomsheet> createState() => _FilterBottomsheetState();
}

class _FilterBottomsheetState extends State<FilterBottomsheet> {
  double? _min;
  double? _max;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: CloseButton(
                onPressed: () {
                  if (_min != null && _max != null) {
                    context.pop(
                      FilterBy(
                        minPrice: _min!,
                        maxPrice: _max!,
                      ),
                    );
                  } else {
                    context.pop();
                  }
                },
              ),
            ),
            const Text('Filtri'),
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 14,
                  bottom: 18,
                ),
                child: Column(
                  children: [
                    const Text('Fascia di prezzo'),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Flexible(
                          child: FilterTextfield(
                            label: 'Minimo',
                            onChanged: (value) {
                              setState(() {
                                _min = double.tryParse(value);
                              });
                            },
                          ),
                        ),
                        Container(
                          height: 1,
                          width: 8,
                          color: Colors.red,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                        ),
                        Flexible(
                          child: FilterTextfield(
                            label: 'Massimo',
                            onChanged: (value) {
                              setState(() {
                                _max = double.tryParse(value);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Cancella tutto'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Mostra risultati'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FilterTextfield extends StatelessWidget {
  const FilterTextfield({
    required this.label,
    required this.onChanged,
    super.key,
  });

  final String label;

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(label),
      ),
      onChanged: onChanged,
      keyboardType: TextInputType.number,
    );
  }
}
