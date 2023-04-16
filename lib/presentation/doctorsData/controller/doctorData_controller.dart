import 'package:hiw/core/app_export.dart';
import '../models/doctorDataModel.dart';

class doctorDataController extends GetxController {
  Rx<doctorDataModel> hospitalDataModelObj = doctorDataModel().obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
