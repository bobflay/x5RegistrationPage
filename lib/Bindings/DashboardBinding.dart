import 'package:get/get.dart';
import 'package:x5registrationpage/Controllers/DashboardController.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DashboardController());
  }
}
