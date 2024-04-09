import 'package:flutter/material.dart';
import 'package:products_app/colors.dart';

class FilterIconButton extends StatelessWidget {
  const FilterIconButton({
    required this.icon,
    required this.text,
    required this.onPressed,
    super.key,
  });

  final Widget icon;

  final String text;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            padding: const MaterialStatePropertyAll(
              EdgeInsets.fromLTRB(
                8,
                4,
                10,
                4,
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.pressed)) {
                  return AppColors.lightBackground.withOpacity(0.7);
                }

                return AppColors.lightBackground;
              },
            ),
          ),
      onPressed: onPressed,
      child: Row(
        children: [
          icon,
          const SizedBox(width: 2),
          Text(
            text,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
