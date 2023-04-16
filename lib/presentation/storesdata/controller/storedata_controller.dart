import 'package:firebase_auth/firebase_auth.dart';
import 'package:hiw/core/app_export.dart';

import '../models/storedata_model.dart';


class storedataController extends GetxController {
  Rx<storedataModel> searchModelObj = storedataModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
