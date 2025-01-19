import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:x5registrationpage/Core/Network/DioClient.dart';
import 'package:x5registrationpage/Core/ShowSuccessDialog.dart';
import 'package:x5registrationpage/Models/User.dart';
import 'package:x5registrationpage/Routes/AppRoute.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  late SharedPreferences prefs;

  @override
  void onInit() {
    super.onInit();
  }

  void _loadSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      Get.offAllNamed(AppRoute.home);
    }
  }

  void login() async {
    // Login logic goes here
    print("Login logic goes here");
    print("Email: ${email.text}");
    print("Password: ${password.text}");

    User user = User(
      email: email.text,
      password: password.text,
    );

    String requestBody = user.toJson();

    var post =
        await Dioclient().getInstance().post('/login', data: requestBody);

    if (post.statusCode == 200) {
      if (post.data['success']) {
        ShowSuccessDialog(
            Get.context!, "Success", "User Logged in Successfully", () {
          prefs.setString('token', post.data['token']);
          Get.toNamed(AppRoute.home);
        });
      } else {
        ShowSuccessDialog(Get.context!, "Failed", "User Login Failed", () {});
      }
    } else {
      ShowSuccessDialog(Get.context!, "Failed", "User Login Failed", () {});
    }
  }
}
