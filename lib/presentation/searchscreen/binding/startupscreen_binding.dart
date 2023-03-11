import '../controller/search_controller.dart';
import 'package:get/get.dart';

class searchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => searchController());
  }
}
