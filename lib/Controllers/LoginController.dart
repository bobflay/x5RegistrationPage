import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:x5registrationpage/Core/Network/DioClient.dart';
import 'package:x5registrationpage/Core/ShowSuccessDialog.dart';
import 'package:x5registrationpage/Models/User.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() async {
    print('Login');
    print("email");
    print(email.text);
    print("password");
    print(password.text);

    User user = User(email: email.text, password: password.text);
    String requestBody = user.toJson();

    var post =
        await Dioclient().getInstance().post('/login', data: requestBody);
    if (post.statusCode == 200) {
      if (post.data['success']) {
        ShowSuccessDialog(
            Get.context!, "Success", "User Logged In Successfully", () {});
      } else {
        ShowSuccessDialog(Get.context!, "Failed",
            "Username or password are not correct", () {});
      }
    } else {
      ShowSuccessDialog(Get.context!, 'Error', 'User Login Failed', () {});
    }
  }
}
