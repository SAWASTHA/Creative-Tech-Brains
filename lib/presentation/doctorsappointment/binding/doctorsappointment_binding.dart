import 'package:get/get.dart';
import '../controller/doctorsappointment_controller.dart';

class doctorsappointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => doctorsappointmentController());
  }
}
