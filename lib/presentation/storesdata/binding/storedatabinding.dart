
import 'package:get/get.dart';

import '../controller/storedata_controller.dart';

class storedataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => storedataController());
  }
}
