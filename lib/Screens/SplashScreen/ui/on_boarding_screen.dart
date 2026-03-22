import 'package:bseera_app/Screens/SplashScreen/controller/splash_controller.dart';
import 'package:bseera_app/Utilities/Constants/image_constant.dart';
import 'package:bseera_app/Utilities/CustomWidgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  final controller = Get.put(SplashController());

  final List data = [
    {
      "image": Images.prayer,
      "title": "تطبيق إنتاجية للمسلمين",
      "desc":
          " يجمع بين أوقات الصلاة وإدارة المهام وتدوين الملاحظات لتحسين الحياة اليومية بالإيمان.",
    },
    {
      "image": Images.quran,
      "title": "تطبيق إنتاجية للمسلمين",
      "desc":
          " يجمع بين أوقات الصلاة وإدارة المهام وتدوين الملاحظات لتحسين الحياة اليومية بالإيمان.",
    },
    {
      "image": Images.nightAndDay,
      "title": "تطبيق إنتاجية للمسلمين",
      "desc":
          " يجمع بين أوقات الصلاة وإدارة المهام وتدوين الملاحظات لتحسين الحياة اليومية بالإيمان.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        /// 🌈 Gradient Background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffF7F9F7), Color(0xffE4EFE7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: SafeArea(
          child: Column(
            children: [
              /// Skip
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: CustomText(
                    "Skip",
                    fontSize: 16.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ),

              /// Pages
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      bool active = controller.currentPage.value == index;
                      return AnimatedOpacity(
                        duration: Duration(milliseconds: 500),
                        opacity: active ? 1 : 0.4,
                        child: AnimatedScale(
                          duration: Duration(milliseconds: 500),
                          scale: active ? 1 : 0.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              /// Circle with Shadow
                              Container(
                                width: 200.w,
                                height: 200.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffDDE5DC),
                                ),
                                child: Image.asset(data[index]["image"]),
                              ),

                              SizedBox(height: 40.h),

                              /// Title
                              CustomText(
                                data[index]["title"],
                                fontSize: 22.sp,
                                color: Color(0xff002055),
                                fontWeight: FontWeight.bold,
                              ),

                              SizedBox(height: 15.h),

                              /// Description
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                child: CustomText(
                                  data[index]["desc"],
                                  textAlign: TextAlign.center,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),

              /// Indicator + Button
              Padding(
                padding: EdgeInsets.only(
                  right: 6.w,
                  left: 39.w,
                  top: 19.h,
                  bottom: 17.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// ✨ Animated Dots
                    Obx(
                      () => Row(
                        children: List.generate(data.length, (index) {
                          bool active = controller.currentPage.value == index;
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            width: active ? 24 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: active
                                  ? Color(0xff546252)
                                  : Colors.grey[400],
                              borderRadius: BorderRadius.circular(20),
                            ),
                          );
                        }),
                      ),
                    ),

                    /// 🚀 Floating Next Button
                    GestureDetector(
                      onTap: controller.nextPage,
                      child: Image.asset(Images.next, scale: 4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
