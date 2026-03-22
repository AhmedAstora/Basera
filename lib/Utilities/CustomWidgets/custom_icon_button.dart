import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/app_color.dart';
import '../Constants/image_constant.dart';
import 'custom_text.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({super.key, required this.title, required this.icon,this.onTap});

  String title;
  Widget icon;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),

        decoration: BoxDecoration(
          color: AppColor.secondary,
          borderRadius: BorderRadius.circular(21),
        ),
        child: Row(
          children: [
            icon,
            SizedBox(width: 5.w),
            CustomText(title,fontWeight: FontWeight.w600,color: AppColor.primary,),
          ],
        ),
      ),
    );
  }
}
