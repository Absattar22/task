import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

abstract final class AppTextStyles {
  static const String _fontFamily = 'Satoshi';

  static TextStyle _base({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.black,
    double? height,
  }) =>
      TextStyle(
        fontFamily: _fontFamily,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
        height: height,
        letterSpacing: -0.5,
      );

  static TextStyle get font28 => _base(fontSize: 28, fontWeight: FontWeight.w800);
  static TextStyle get font22 => _base(fontSize: 22, fontWeight: FontWeight.w700);
  static TextStyle get font18 => _base(fontSize: 18, fontWeight: FontWeight.w600);
  static TextStyle get font16 => _base(fontSize: 16, fontWeight: FontWeight.w600);
  static TextStyle get font15 => _base(fontSize: 15, fontWeight: FontWeight.w500);
  static TextStyle get font14 => _base(fontSize: 14);
  static TextStyle get font12 => _base(fontSize: 12);
    static TextStyle get font13 => _base(fontSize: 13);
  static TextStyle get font11 => _base(fontSize: 11);
  static TextStyle get font10 => _base(fontSize: 10, color: AppColors.grey);
  static TextStyle get font8 => _base(fontSize: 8, color: AppColors.grey);
  static TextStyle get font7 => _base(fontSize: 7, color: AppColors.grey);
  static TextStyle get font6 => _base(fontSize: 6, color: AppColors.grey);
}
