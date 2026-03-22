import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pinput/pinput.dart';
import '../../../Utilities/Constants/app_color.dart';
import '../../../Utilities/Constants/image_constant.dart';

import '../../../Utilities/CustomWidgets/custom_text.dart';
import '../controller/auth_controller.dart';

class SendCodeScreen extends StatelessWidget {
  SendCodeScreen({super.key, this.isFromLoin = false});

  bool isFromLoin;

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (con) {
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: AppColor.getGradient(stops: [0, 0.27]),
            ),
            child:  SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 110.h),
                    Row(
                      children: [

                        SizedBox(width: 38.w),
                      ],
                    ),
                    SizedBox(height: 10.h),

                    CustomText(
                      "Check your inbox!",
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      "We sent a 4-digit code to your email",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 37.h),
                    Container(
                      alignment: Alignment.center,
                      child: Directionality(
                        textDirection: ui.TextDirection.ltr,
                        child: Pinput(
                          length: 4,

                          controller: con.pinPutController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            con.forceError = false;
                            con.update();
                          },
                          // pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                          validator: (value) => con.codeValidation(value),
                          forceErrorState: con.forceError,
                          // errorText: "Error Code",
                          // errorTextStyle: TextStyle(
                          //   color: AppColor.primary,
                          //   fontSize: 12.sp,
                          // ),
                          errorPinTheme: PinTheme(
                            width: 60.r,
                            height: 60.r,
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            textStyle: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                              height: 0,
                              fontWeight: FontWeight.w500,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.red.withValues(alpha: .3),
                              border: Border.all(
                                color: Colors.red.withValues(alpha: .8),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          defaultPinTheme: PinTheme(
                            width: 60.r,
                            height: 60.r,
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            textStyle: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              height: 0,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: AppColor.primary.withValues(alpha: .5),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          submittedPinTheme: PinTheme(
                            width: 60.r,
                            height: 60.r,
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            textStyle: TextStyle(
                                fontSize: 24.sp,
                                color: AppColor.primary.withValues(alpha: .5),
                              height: 0,
                              fontWeight: FontWeight.w700,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color:AppColor.primary.withValues(alpha: .5),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          focusedPinTheme: PinTheme(
                            width: 60.r,
                            height: 60.r,
                            margin: EdgeInsets.symmetric(horizontal: 2.w),
                            textStyle: TextStyle(
                              fontSize: 24.sp,
                              color: AppColor.primary,
                              height: 0,
                              fontWeight: FontWeight.w700,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: AppColor.primary, width: 1.5),
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          focusNode: con.pinPutFocusNode,
                        ),
                      ),
                    ),
                    SizedBox(height: 21.h),

                    Row(
                      children: [
                        CustomText("Didn’t you receive the code?"),
                        CustomText(" Resend code", color: AppColor.primary),
                        SizedBox(height: 38.h),
                      ],
                    ),

                  ],
                ),
              ),
            ),

        );
      },
    );
  }
}
