import 'package:get/get.dart';
import 'package:x5registrationpage/Bindings/RegistrationBinding.dart';
import 'package:x5registrationpage/Routes/AppRoute.dart';
import 'package:x5registrationpage/Views/Registration.dart';

class AppPage {
  static final List <GetPage> pages = [

    GetPage(name: AppRoute.register, page: ()=> Registration(),binding: RegistrationBinding())
  ];
}
