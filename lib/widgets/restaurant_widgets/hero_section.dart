import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/app_colors.dart';
import '../../models/restaurant.dart';
import '../../core/widgets/frosted_circle_button.dart';

class HeroSection extends StatelessWidget {
  final Restaurant restaurant;

  const HeroSection({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(restaurant.heroImagePath, fit: BoxFit.cover),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.5, 1.0],
                colors: [
                  Color(0x55000000),
                  Color(0x88000000),
                  AppColors.black,
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 8.h,
            left: 16.w,
            child: FrostedCircleButton(
              icon: Icons.arrow_back,
              onTap: () {},
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 8.h,
            right: 16.w,
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/images/person.png',
                width: 46.w,
                height: 46.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
