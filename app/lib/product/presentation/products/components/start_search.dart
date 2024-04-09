import 'package:flutter/material.dart';

class StartSearch extends StatelessWidget {
  const StartSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '🔎',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            'Inizia una ricerca',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
