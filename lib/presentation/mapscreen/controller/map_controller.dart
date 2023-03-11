import 'package:hiw/core/app_export.dart';
import 'package:hiw/presentation/mapscreen/models/mapModel.dart';

class mapController extends GetxController {
  Rx<mapModel> searchModelObj = mapModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
