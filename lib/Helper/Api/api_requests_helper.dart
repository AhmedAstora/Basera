import 'dart:developer';
import 'dart:io';


import '../SharedPreferance/shared_preferance.dart';
import 'api_constant.dart';
import 'dio_client.dart';
import 'package:dio/dio.dart' as dio;

class ApiRequestHelper {
  // static String apiToken = SpHelper.spHelper.getApiToken();

  // static Future<LoginResponse?> login(Map<String, dynamic>? data) async {
  //   dio.Response? response = await DioClient.dioClient.postDio(
  //     ApiConstant.loginEndpoint,
  //     data,
  //     showResult: true,
  //   );
  //
  //   LoginResponse? profileResponse;
  //   if (response != null) {
  //     profileResponse = LoginResponse.fromJson(response.data);
  //   }
  //   return profileResponse;
  // }


}
