import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiw/core/app_export.dart';
import '../models/hospitalsearchmodel.dart';

class hospitalsearchController extends GetxController {
  Rx<hospitalsearchmodel> searchModelObj = hospitalsearchmodel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
