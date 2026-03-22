import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Utilities/Constants/app_color.dart';
import '../../../Utilities/Constants/image_constant.dart';
import '../../../Utilities/CustomWidgets/custom_text.dart';
import '../../../Utilities/CustomWidgets/custom_text_field.dart';
import '../controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (con) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),

                  child: Column(children: [SizedBox(height: 60.h)]),
                ),
                SizedBox(height: 60.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        'Login here',
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primary,
                      ),
                      CustomText(
                        'Welcome back you’ve',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondary,
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      CustomTextField(
                        hintText: "Email",
                        borderColor: Color(0xff546252),
                        controller: TextEditingController(),
                        borderWidth: 2,
                        hintColor: Color(0xff293767),
                        fontSize: 14.sp,
                      ),
                      SizedBox(height: 25.h),
                      CustomTextField(
                        hintText: "Password",
                        borderColor: Color(0xff546252),
                        controller: TextEditingController(),
                        borderWidth: 2,
                        hintColor: Color(0xff293767),
                        fontSize: 14.sp,
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          SizedBox(width: 10.w),
                          CustomText("Remember Me", color: Colors.white),
                          SizedBox(width: 60.w),
                        ],
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
                CustomText('or', fontSize: 16.sp, fontWeight: FontWeight.w600),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
