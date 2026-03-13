import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/app_colors.dart';
import '../../core/app_text_styles.dart';
import '../../models/restaurant.dart';

class RestaurantInfo extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantInfo({super.key, required this.restaurant});

  final LinearGradient gradient = const LinearGradient(
    colors: [AppColors.gold, AppColors.peach],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.tagline,
            style: AppTextStyles.font10.copyWith(
              color: AppColors.white.withValues(alpha: 0.8),
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
            ),
          ),
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => gradient.createShader(bounds),
            child: Text(
              restaurant.name,
              style: AppTextStyles.font22.copyWith(
                fontSize: 34.sp,
                fontWeight: FontWeight.w800,
                height: 1.2,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            restaurant.description,
            style: AppTextStyles.font16.copyWith(
              color: AppColors.white.withValues(alpha: 0.7),
              fontWeight: FontWeight.w500,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
