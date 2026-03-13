import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/app_colors.dart';
import '../core/app_text_styles.dart';
import '../view_models/restaurant_view_model.dart';
import '../core/widgets/section_header.dart';
import '../widgets/restaurant_widgets/hero_section.dart';
import '../widgets/restaurant_widgets/restaurant_info.dart';
import '../widgets/restaurant_widgets/atmosphere_carousel.dart';
import '../widgets/restaurant_widgets/masonry_grid.dart';

class RestaurantScreen extends StatelessWidget {
  RestaurantScreen({super.key});

  final vm = RestaurantViewModel();

  @override
  Widget build(BuildContext context) {
    final restaurant = vm.restaurant;
    final dishes = vm.dishes;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: HeroSection(restaurant: restaurant),
          ),
          SliverToBoxAdapter(
            child: RestaurantInfo(restaurant: restaurant),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 24.w, bottom: 8.h),
              child: const SectionHeader(title: 'Atmosphere'),
            ),
          ),
          SliverToBoxAdapter(
            child: AtmosphereCarousel(imagePaths: restaurant.atmosphereImagePaths),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 32.w, top: 24.h, bottom: 16.h),
              child: Text(
                'Food Menu',
                style: AppTextStyles.font18.copyWith(
                  color: AppColors.white.withValues(alpha: 0.81),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: MasonryGrid(dishes: dishes),
          ),
        ],
      ),
    );
  }
}
