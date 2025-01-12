import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:x5registrationpage/Core/Network/DioClient.dart';
import 'package:x5registrationpage/Core/ShowSuccessDialog.dart';
import 'package:x5registrationpage/Models/User.dart';

class RegistrationController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  void register() async {
    User user = User(
        name: name.text,
        email: email.text,
        phone: phone.text,
        password: password.text);

    String requestBody = user.toJson();
    var post =
        await Dioclient().getInstance().post('/register', data: requestBody);
    if (post.statusCode == 200) {
      ShowSuccessDialog(
          Get.context!, 'Success', 'User Registered Successfully', () {});
    } else {
      ShowSuccessDialog(
          Get.context!, 'Error', 'User Registration Failed', () {});
    }
  }
}
