import '../controller/walkthrough_three_controller.dart';
import 'package:get/get.dart';

class WalkthroughThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalkthroughThreeController());
  }
}
