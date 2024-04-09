import 'package:flutter/material.dart';
import 'package:products_app/app_colors.dart';

class BottomsheetHeader extends StatelessWidget {
  const BottomsheetHeader({
    required this.title,
    required this.onClose,
    super.key,
  });

  final String title;

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 5,
          width: 45,
          decoration: BoxDecoration(
            color: AppColors.grey600,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(
          height: 91,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  padding: const EdgeInsets.fromLTRB(
                    8,
                    8,
                    16,
                    8,
                  ),
                  icon: const Icon(
                    Icons.close,
                    size: 32,
                  ),
                  onPressed: onClose,
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
