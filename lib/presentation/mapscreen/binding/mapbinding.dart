import '../controller/map_controller.dart';
import 'package:get/get.dart';

class mapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => mapController());
  }
}
