import '../controller/startupscreen_controller.dart';
import 'package:get/get.dart';

class StartupscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StartupscreenController());
  }
}
