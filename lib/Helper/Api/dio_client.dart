import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart' as GET;


import '../../Utilities/Constants/app_color.dart';
import '../../Utilities/CustomWidgets/custom_text.dart';
import '../SharedPreferance/shared_preferance.dart';
import 'api_constant.dart';

class DioClient {
  DioClient._() {
    initDio();
  }

  static final DioClient dioClient = DioClient._();
  Dio? dio;

  initDio() {
    dio = Dio();
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        };
    dio!.options.baseUrl = ApiConstant.baseUrl;
  }

  bool internet = false;

  checkInternet() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        internet = true;
      }
    } on SocketException catch (_) {
      GET.Get.snackbar(
        "No Internet",
        "check your internet connection",
        colorText: Colors.white,
        messageText: CustomText(
          "check your internet connection",
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: Colors.amber,
        icon: const Icon(Icons.add_alert, color: Colors.white),
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      );
      print('not connected');
      internet = false;
    }

    return internet;
  }

  Future getDio(
    String endPoint, {
    Map<String, dynamic>? queryParameter,
    bool isAuth = false,
    CancelToken? cancelToken,
  }) async {
    await checkInternet();
    if (internet) {
      // dio!.options.headers["Accept-Language"] =
      //     GET.Get.locale!.languageCode == "ar" ? "Ar-SA" : "En-us";
      if (isAuth) {
        dio!.options.headers = {
          "X-API-Key": ApiConstant.xApiKey,
          "Authorization":  "Bearer ${SpHelper.spHelper.getSessionToken()}",

        };
      }

      log("Access Token :  ${SpHelper.spHelper.getApiToken()}");
      log("Access Token :  Bearer ${SpHelper.spHelper.getApiToken()}");
      // log(endPoint.toString());
      Response? response;
      try {
        response = await dio!.get(
          endPoint,
          queryParameters: queryParameter,
          cancelToken: cancelToken,
        );
        ApiConstant.log(response.data);
      } on DioException catch (e) {
        ApiConstant.log(e.toString());
        ApiConstant.log(e.response?.data.toString());
        ApiConstant.log(e.requestOptions.uri.toString());

        if (e.response?.statusCode == 401 || e.response?.statusCode ==403) {
          // final controller = GET.Get.put(ProfileController());
          // controller.logout();
        }
        response = e.response;
        // }
        // log(e.message.toString());
        //
        log(e.response.toString());
        return ;
      } catch (error) {
        // Handle error
        log('Error: $error');
        return ;
      }
      return response;
    }
  }

  Future postDio(
    String endPoint,
      Map<String, dynamic>? body, {
    Map<String, dynamic>? queryParameter,
    bool isAuth = false,
    bool showResult = false,
    bool back = false,
  }) async {
    ApiConstant.log(body.toString());
    await checkInternet();
    if (internet) {
      dio!.options.headers["X-localization"] =
          GET.Get.locale?.languageCode == "ar" ? "ar" : "en";
      dio!.options.headers["Accept"] = "application/json";

      if (isAuth) {
        dio!.options.headers = {
          "X-API-Key": ApiConstant.xApiKey,
          "Authorization":  "Bearer ${SpHelper.spHelper.getSessionToken()}",

        };
      }
      // dio!.options.queryParameters = {'lang':SpHelper.spHelper.getLang()!};
      // log(dio!.options.headers.toString());
      Response? response;

      try {
        response = await dio!.post(
          endPoint,
          queryParameters: queryParameter,
          data: body,
          options: Options(followRedirects: false),
        );
        ApiConstant.log(response.data.toString());

        if (back && response.data['success']) {
          GET.Get.back();
        }
        showResultFun(showResult, response);
        ApiConstant.log(response.toString());

      } on DioException catch (e) {
        ApiConstant.log(e.response?.data.toString());
        showResultFun(showResult, e.response);

        if (e.response?.statusCode == 401) {
          // final controller = GET.Get.put(ProfileController());
          // controller.logout();
        }
        response = e.response;
        // }
        // log(e.message.toString());
        //
        // log(e.response.toString());
        return response;
      } catch (error) {
        // Handle error

        log('Error: $error');
        return ;
      }

      return response;
    }
  }

  Future putDio(
    String endPoint,
      Map<String, dynamic>? body, {
    Map<String, dynamic>? queryParameter,
    bool isAuth = false,
    bool showResult = false,
    bool back = false,
  }) async {
    ApiConstant.log(body.toString());
    await checkInternet();
    if (internet) {
      dio!.options.headers["X-localization"] =
          GET.Get.locale?.languageCode == "ar" ? "ar" : "en";
      dio!.options.headers["Accept"] = "application/json";

      if (isAuth) {
        dio!.options.headers = {
          "X-API-Key": ApiConstant.xApiKey,
          "Authorization":  "Bearer ${SpHelper.spHelper.getSessionToken()}",

        };
      }
      // dio!.options.queryParameters = {'lang':SpHelper.spHelper.getLang()!};
      // log(dio!.options.headers.toString());
      Response? response;

      try {
        response = await dio!.put(
          endPoint,
          queryParameters: queryParameter,
          data: body,

        );
        ApiConstant.log(response.data.toString());

        if (back && response.data['success']) {
          GET.Get.back();
        }
        showResultFun(showResult, response);
      } on DioException catch (e) {
        ApiConstant.log(e.response?.data.toString());
        // if(e.response!=null && e.response?.data!=null){
        // showResultFun(showResult, e.response!);
        // }

        if (e.response?.statusCode == 401) {
          // final controller = GET.Get.put(ProfileController());
          // controller.logout();
        }
        response = e.response;

        // log(e.message.toString());
        //
        // log(e.response.toString());
        return ;
      } catch (error) {
        // Handle error

        log('Error: $error');
        return ;
      }
      return response;
    }
  }

  showResultFun(bool showResult, Response? response) {
    if (showResult) {
      GET.Get.snackbar(
        "Result".tr,
        "${response?.data['message']}",
        colorText: Colors.white,
        backgroundColor: response?.data['success']
            ? Colors.green
            : AppColor.yellowColor,
        icon: const Icon(Icons.add_alert_rounded),
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      );
    }
  }
}
