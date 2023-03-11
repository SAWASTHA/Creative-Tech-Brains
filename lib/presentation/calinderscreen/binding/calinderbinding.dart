import '../controller/calinder_controller.dart';
import 'package:get/get.dart';

class calinderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => calinderController());
  }
}
