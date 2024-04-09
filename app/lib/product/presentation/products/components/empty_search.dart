import 'package:flutter/material.dart';

class EmptySearch extends StatelessWidget {
  const EmptySearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '🫙',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            'Nessun prodotto trovato',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
