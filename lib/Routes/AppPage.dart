import 'package:get/get.dart';
import 'package:x5registrationpage/Bindings/LoginBinding.dart';
import 'package:x5registrationpage/Bindings/RegistrationBinding.dart';
import 'package:x5registrationpage/Routes/AppRoute.dart';
import 'package:x5registrationpage/Views/Login.dart';
import 'package:x5registrationpage/Views/Registration.dart';

class AppPage {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoute.register,
        page: () => Registration(),
        binding: RegistrationBinding()),
    GetPage(name: AppRoute.login, page: () => Login(), binding: LoginBinding())
  ];
}
