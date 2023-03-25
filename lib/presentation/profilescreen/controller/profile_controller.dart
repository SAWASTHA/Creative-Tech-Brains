import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiw/core/app_export.dart';
import 'package:hiw/presentation/profilescreen/models/profileModel.dart';

class profileController extends GetxController {
  Rx<profileModel> searchModelObj = profileModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
