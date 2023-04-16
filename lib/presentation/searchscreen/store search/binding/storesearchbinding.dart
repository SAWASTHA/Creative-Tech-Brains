import 'package:get/get.dart';
import '../controller/storesearch_controller.dart';

class storesearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => storesearchController());
  }
}
