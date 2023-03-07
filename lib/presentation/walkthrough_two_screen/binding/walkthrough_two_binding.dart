import '../controller/walkthrough_two_controller.dart';
import 'package:get/get.dart';

class WalkthroughTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalkthroughTwoController());
  }
}
