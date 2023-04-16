import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiw/core/app_export.dart';
import '../models/doctorsearchmodel.dart';

class doctorsearchController extends GetxController {
  Rx<doctorsearchmodel> searchModelObj = doctorsearchmodel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
