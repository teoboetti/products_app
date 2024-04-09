import 'package:flutter/material.dart';
import 'package:products_app/app_colors.dart';

class ProductSearchbar extends StatefulWidget {
  const ProductSearchbar({
    required this.controller,
    this.onTap,
    super.key,
  });

  final TextEditingController controller;

  final VoidCallback? onTap;

  @override
  State<ProductSearchbar> createState() => _ProductSearchbarState();
}

class _ProductSearchbarState extends State<ProductSearchbar> {
  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.border300,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(1000),
      ),
    );

    return TextField(
      controller: widget.controller,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            height: 1.5,
          ),
      decoration: InputDecoration(
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        suffixIcon: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            margin: const EdgeInsets.only(
              top: 6,
              right: 6,
              bottom: 6,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.brand,
            ),
            child: const Icon(
              Icons.search,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        hintText: 'Cerca...',
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.5,
              color: AppColors.gray700,
            ),
        contentPadding: const EdgeInsets.only(
          left: 16,
          top: 6,
          bottom: 6,
        ),
      ),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
