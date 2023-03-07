import '../controller/los_controller.dart';
import 'package:get/get.dart';

class LosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LosController());
  }
}
