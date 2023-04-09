import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiw/core/app_export.dart';
import '../models/editModel.dart';

class editController extends GetxController {
  Rx<editModel> searchModelObj = editModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
