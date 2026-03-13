import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_text_styles.dart';

class CategoryLabel extends StatelessWidget {
  final String category;

  const CategoryLabel({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Text(
      category,
      style: AppTextStyles.font15.copyWith(
        color: AppColors.white.withValues(alpha: 0.6),
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
