import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/app_color.dart';

class BackArrowHeader extends StatelessWidget {
  const BackArrowHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: CircleAvatar(
        radius: 16.5,
        backgroundColor: AppColor.inActiveColor,
        child: Padding(
          padding: EdgeInsets.only(left: 6),
          child: Icon(Icons.arrow_back_ios, color: AppColor.primary, size: 13),
        ),
      ),
    );
  }
}
