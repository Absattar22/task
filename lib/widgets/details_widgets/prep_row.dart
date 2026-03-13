import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'prep_rect.dart';

class PrepRow extends StatelessWidget {
  final String prepTime;
  final String servingSize;

  const PrepRow({super.key, required this.prepTime, required this.servingSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PrepRect(label: prepTime),
        SizedBox(width: 4.w),
        PrepRect(label: servingSize),
      ],
    );
  }
}
