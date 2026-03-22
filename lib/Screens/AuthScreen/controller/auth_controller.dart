import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ui/send_code_screen.dart';

class CountryModel {
  final String name;
  final String flag;

  CountryModel(this.name, this.flag);
}

class AuthController extends GetxController{

  CountryModel? selectedCountry;
  String? selectedCity;

  final cities = ['Madrid', 'Barcelona', 'Valencia'];
  var pinPutController = TextEditingController();
  bool forceError = false;
  DateTime endTime = DateTime.now().add(Duration(seconds: 60));
  bool wrongCode = false;
  bool isExpire = false;
  final FocusNode pinPutFocusNode = FocusNode();

  String? codeValidation(String? value) {
    if (value!.isEmpty) {
      return "Pin is incorrect".tr;
    }
    if (value.length != 4) {

      forceError = true;
      update();
      return "Pin is incorrect".tr;
    }

    final RegExp regexEmoji = RegExp(
      r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
    );
    if (regexEmoji.hasMatch(value)) {
      return 'mobile number Contain Emoji'.tr;
    }
    return null;
  }
  bool isTappedForgotPassword = false;
  bool isTappedNavigationForgotPassword = false;
  bool isTappedCheckBox = false;
  bool isTappedSendCode = false;
  bool isTappedConfirm = false;
  bool isTappedUpdatePassword = false;
  bool isTappedNavigationAddName = false;
  bool isTappedNavigationPhotoSignUp = false;
  bool isTappedNavigationAboutYouSignUp = false;
  bool isTappedNavigationTermsOfUse = false;
  bool isTappedNavigationHomePage = false;

  onTapForgotPassword() {
    isTappedForgotPassword = true;

    update();

  }
  onTapSendCode() {
    isTappedSendCode = true;

    update();
    Get.to(() => SendCodeScreen());
  }
  onTapConfirm(bool isFromLogin) {
  }
  onTapCheckBox() {
    isTappedCheckBox = true;
    update();
  }
}