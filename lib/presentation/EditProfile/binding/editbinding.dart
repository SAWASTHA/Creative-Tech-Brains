import '../controller/edit_controller.dart';
import 'package:get/get.dart';

class editBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => editController());
  }
}
