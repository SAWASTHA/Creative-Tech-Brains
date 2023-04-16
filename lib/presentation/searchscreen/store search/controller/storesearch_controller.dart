import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiw/core/app_export.dart';
import '../models/storesearchmodel.dart';

class storesearchController extends GetxController {
  Rx<storesearchmodel> searchModelObj = storesearchmodel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
