import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../app_colors.dart';

class FrostedCircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const FrostedCircleButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            width: 56.w,
            height: 56.w,
            decoration: BoxDecoration(
               shape: BoxShape.circle,
               color: Colors.black.withValues(alpha: 0.30),
               border: Border.all(color: const Color(0xFF2C2C2C)),
            ),
            child: Icon(icon, color: AppColors.white, size: 36.sp),
          ),
        ),
      ),
    );
  }
}
