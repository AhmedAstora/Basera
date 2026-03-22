// import 'dart:io';
//
// import 'package:device_info_plus/device_info_plus.dart';
//
// class DeviceInfoHelper {
//   DeviceInfoHelper._();
//
//   static DeviceInfoHelper deviceInfoHelper = DeviceInfoHelper._();
//   static String platform = "";
//   static String deviceId = "";
//   static String deviceName = "";
//   static String deviceBrand = "";
//
//
//   initDeviceInfo() async {
//     if (Platform.isAndroid) {
//       platform = "ANDROID";
//     } else {
//       platform = "IOS";
//     }
//
//     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//
//     if (Platform.isAndroid) {
//       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//       deviceId = androidInfo.id;
//       deviceName = androidInfo.model;
//       deviceBrand = androidInfo.brand;
//
//
//     } else if (Platform.isIOS) {
//       IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//       deviceId = iosInfo.identifierForVendor??"";
//       deviceName = iosInfo.utsname.machine;
//       deviceBrand = iosInfo.model;
//
//
//     }
//   }
// }
