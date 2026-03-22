
import 'dart:developer';

import 'package:bseera_app/Screens/SplashScreen/ui/on_boarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../../../Helper/Api/api_constant.dart';
import '../../../Helper/Api/dio_client.dart';

import '../../../Helper/SharedPreferance/shared_preferance.dart';
import '../../AuthScreen/ui/login_screen.dart';




class SplashController extends GetxController {
  bool isTappedLogin = false;
  bool isTappedSignUp = false;

  PageController pageController = PageController();
  var currentPage = 0.obs;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {


        update();
        Get.to(()=>LoginScreen());

    }
  }



  getOnBoarding() async {
  }
  navigationFunction() async {
    await Future.delayed(const Duration(milliseconds: 2000));

    if (SpHelper.spHelper.getIsLoginFirstTime()) {
      Get.off(() =>  OnBoardingScreen(
      ));
    } else {
      // Get.off(() => MainNavigationScreen());
    }
    // Get.off(() => MainScreen());
  }
}
