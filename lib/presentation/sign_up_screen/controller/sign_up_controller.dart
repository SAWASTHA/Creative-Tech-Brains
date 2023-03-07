import 'package:hiw/core/app_export.dart';
import 'package:hiw/presentation/sign_up_screen/models/sign_up_model.dart';

class SignUpController extends GetxController {
  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
