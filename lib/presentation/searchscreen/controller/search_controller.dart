import 'package:hiw/core/app_export.dart';
import 'package:hiw/presentation/searchscreen/models/searchModel.dart';

class searchController extends GetxController {
  Rx<searchModel> searchModelObj = searchModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
