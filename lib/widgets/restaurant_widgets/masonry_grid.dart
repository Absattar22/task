import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/dish.dart';
import 'dish_card.dart';
import '../../views/dish_detail_screen.dart';

class MasonryGrid extends StatelessWidget {
  final List<Dish> dishes;

  const MasonryGrid({super.key, required this.dishes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 40.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                for (int i = 0; i < dishes.length; i += 2)
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: DishCard(
                      dish: dishes[i],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DishDetailScreen(dish: dishes[i]),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 40.h),
                for (int i = 1; i < dishes.length; i += 2)
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: DishCard(
                      dish: dishes[i],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DishDetailScreen(dish: dishes[i]),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
