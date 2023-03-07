import '../controller/walkthrough_one_controller.dart';
import 'package:get/get.dart';

class WalkthroughOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WalkthroughOneController());
  }
}
