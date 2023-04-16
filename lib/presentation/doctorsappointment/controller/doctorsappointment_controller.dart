import 'package:hiw/core/app_export.dart';
import '../models/doctorsappointmentDataModel.dart';


class doctorsappointmentController extends GetxController {
  Rx<doctorsappointmentDataModel> hospitalDataModelObj = doctorsappointmentDataModel().obs;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
