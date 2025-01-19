import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:x5registrationpage/Core/Network/DioClient.dart';
import 'package:x5registrationpage/Core/ShowSuccessDialog.dart';
import 'package:x5registrationpage/Models/User.dart';
import 'package:x5registrationpage/Routes/AppRoute.dart';

class DashboardController extends GetxController {
  late SharedPreferences prefs;

  @override
  void onInit() {
    super.onInit();
    _loadSharedPreferences();
  }

  void _loadSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') == null) {
      Get.offAllNamed(AppRoute.login);
    }
  }

  void logout() async {
    prefs.remove('token');
    Get.offAllNamed(AppRoute.login);
  }
}
