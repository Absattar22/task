import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/app_colors.dart';
import '../core/app_text_styles.dart';
import '../models/dish.dart';
import '../view_models/dish_detail_view_model.dart';
import '../core/widgets/frosted_circle_button.dart';
import '../widgets/details_widgets/slide_to_order_bar.dart';
import '../core/widgets/section_header.dart';
import '../widgets/details_widgets/hero_image.dart';
import '../widgets/details_widgets/category_label.dart';
import '../widgets/details_widgets/dish_title.dart';
import '../widgets/details_widgets/description_text.dart';
import '../widgets/details_widgets/prep_row.dart';

class DishDetailScreen extends StatelessWidget {
  final Dish dish;

  const DishDetailScreen({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    final vm = DishDetailViewModel(dish: dish);

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeroImage(imagePath: vm.dish.imagePath, height: 400.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoryLabel(category: vm.dish.category),
                      SizedBox(height: 4.h),
                      DishTitle(name: vm.dish.name),
                      SizedBox(height: 8.h),
                      DescriptionText(text: vm.dish.description),
                      SizedBox(height: 16.h),
                      const SectionHeader(title: 'Preparation'),
                      SizedBox(height: 8.h),
                      PrepRow(
                        prepTime: vm.dish.prepTime,
                        servingSize: vm.dish.servingSize,
                      ),
                      SizedBox(height: 16.h),
                      SlideToOrderBar(
                        price: vm.dish.price,
                        onConfirmed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${vm.dish.name} added to order!',
                                style: AppTextStyles.font12.copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                              backgroundColor: AppColors.gold,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: FrostedCircleButton(
                icon: Icons.arrow_back,
                onTap: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
