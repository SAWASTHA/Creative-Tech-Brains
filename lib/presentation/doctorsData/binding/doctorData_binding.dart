import 'package:get/get.dart';
import '../controller/doctorData_controller.dart';

class doctorDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => doctorDataController());
  }
}
