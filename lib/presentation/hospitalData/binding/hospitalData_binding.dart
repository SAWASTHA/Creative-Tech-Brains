import '../controller/hospitalData_controller.dart';
import 'package:get/get.dart';

class hospitalDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => hospitalDataController());
  }
}
