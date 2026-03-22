import 'dart:developer' as lo;

class ApiConstant {
  // static const String baseUrl = 'https://dev-api.foodops.io/api/';
  // static const String baseUrlImage = 'https://dev-api.foodops.io/';
  static const String baseUrl = 'http://10.0.2.2:5062/api/';
  static const String baseUrlImage = 'http://10.0.2.2:5062/';

  static const String googleApiKey = "AIzaSyC0-TS0r8pXeaJKd_XxvEL9AE85_Y2HRqg";
  static const String xApiKey = "fdr_dev_t2iogz_GQqPBVJN3DAe87ARVT2irnJ4TpW5595hlfF9006y8ztjl88uQPjz6eBp4fm4oRYf";

  static const String sendOtpEndpoint = "Auth/request-otp";
  static const String verifyOtpEndpoint = "Auth/verify-otp";
  static const String resendOtpEndpoint = "Auth/resend-otp";

  static const String getOrganizationEndpoint = "Organizations/my";
  static const String updateOrganizationEndpoint = "Organizations/switch";

  static const String getSessionEndpoint =
      "Sessions/my";

  static const String joinSessionEndpoint =
      "Sessions/join";

  static const String loginEndpoint = "auth/login";
  static const String profileEndpoint = "User/profile";

  static const String orderDeliveryEndpoint = "delivery-management/orders";

  static const String homeEndpoint = "dashboard/delivery";

  static const String cashOnHandEndpoint = "cash-on-hand/cash-summary";
  static const String cashOnHandDayEndpoint = "cash-on-hand/day-transactions";
  static const String handoverEndpoint = "cash-on-hand/handover";

  static const String orderEndpoint = "orders";
  static const String orderDetailsEndpoint = "orders/details";
  static const String updateOrderStatusEndpoint = "orders/status";
  static const String paymentEndpoint = "orders/order/payment";




  static const String inboxEndpoint = "inbox";
  static const String getOutletEndpoint = "Outlets";
  static const String selectOutletEndpoint = "Outlets/select-outlet";




  static void log(dynamic message, {String tag = "HUNTER"}) {
    lo.log(tag + message.toString());
  }
}

enum Entitlement { free, allCourses }
