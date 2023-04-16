import '../controller/hospitalsearch_controller.dart';
import 'package:get/get.dart';

class hospitalsearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => hospitalsearchController());
  }
}
