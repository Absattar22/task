import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_text_styles.dart';

class DishTitle extends StatelessWidget {
  final String name;

  const DishTitle({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [AppColors.gold, AppColors.peach],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(bounds),
      blendMode: BlendMode.srcIn,
      child: Text(
        name,
        style: AppTextStyles.font28.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          height: 1.25,
        ),
      ),
    );
  }
}
