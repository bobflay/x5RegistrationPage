import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:x5registrationpage/Core/Network/DioClient.dart';
import 'package:x5registrationpage/Core/ShowSuccessDialog.dart';
import 'package:x5registrationpage/Models/User.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
            Get.context!, "Success", "User Logged in Successfully", () {});
      } else {
        ShowSuccessDialog(Get.context!, "Failed", "User Login Failed", () {});
      }
    } else {
      ShowSuccessDialog(Get.context!, "Failed", "User Login Failed", () {});
    }
  }
}
