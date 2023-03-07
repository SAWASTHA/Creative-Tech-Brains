import 'package:hiw/core/app_export.dart';
import 'package:hiw/presentation/startupscreen_screen/models/startupscreen_model.dart';

class StartupscreenController extends GetxController {
  Rx<StartupscreenModel> startupscreenModelObj = StartupscreenModel().obs;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.toNamed(AppRoutes.walkthroughOneScreen);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
