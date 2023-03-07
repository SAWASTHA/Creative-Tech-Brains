import 'package:hiw/core/app_export.dart';
import 'package:hiw/presentation/los_screen/models/los_model.dart';

class LosController extends GetxController {
  Rx<LosModel> losModelObj = LosModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
