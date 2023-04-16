import 'package:hiw/core/app_export.dart';
import '../models/hospitalDataModel.dart';

class hospitalDataController extends GetxController {
  Rx<hospitalDataModel> hospitalDataModelObj = hospitalDataModel().obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
