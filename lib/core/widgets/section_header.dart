import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../app_colors.dart';
import '../app_text_styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final bool goldBackground;

  const SectionHeader({
    super.key,
    required this.title,
    this.goldBackground = false,
  });

  @override
  Widget build(BuildContext context) {
    if (goldBackground) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          title,
          style: AppTextStyles.font15.copyWith(color: AppColors.black),
        ),
      );
    }
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: Text(
        title,
        style: AppTextStyles.font16.copyWith(
          color: AppColors.white.withValues(alpha: 0.7),
        ),
      ),
    );
  }
}
