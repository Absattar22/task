import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AtmosphereCarousel extends StatelessWidget {
  final List<String> imagePaths;

  const AtmosphereCarousel({super.key, required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: imagePaths.length,
        separatorBuilder: (ctx, i) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: SizedBox(
              width: 220.w,
              height: 160.h,
              child: Image.asset(imagePaths[index], fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
