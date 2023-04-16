
import 'package:get/get.dart';

import '../controller/doctorsearch_controller.dart';

class doctorsearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => doctorsearchController());
  }
}
