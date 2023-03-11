import 'package:hiw/core/app_export.dart';
import 'package:hiw/presentation/Homescreen/models/homeModel.dart';

class homeController extends GetxController {
  Rx<homeModel> searchModelObj = homeModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
