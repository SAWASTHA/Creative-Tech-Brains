import '../controller/home_controller.dart';
import 'package:get/get.dart';

class homeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => homeController());
  }
}
