import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiw/core/app_export.dart';
import 'package:hiw/presentation/startupscreen_screen/models/startupscreen_model.dart';

class StartupscreenController extends GetxController {
  Rx<StartupscreenModel> startupscreenModelObj = StartupscreenModel().obs;

  User? firebaseUser = FirebaseAuth.instance.currentUser;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 3000), () {
      if (firebaseUser != null) {
        onTapImgHome();
      } else {
        Get.toNamed(AppRoutes.walkthroughOneScreen);
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  onTapImgHome() {
    Get.toNamed(AppRoutes.homeScreen);
  }
}
