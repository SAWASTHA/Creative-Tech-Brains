import 'package:hiw/core/app_export.dart';
import 'package:hiw/presentation/calinderscreen/models/calanderModel.dart';

class calinderController extends GetxController {
  Rx<calanderModel> searchModelObj = calanderModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
