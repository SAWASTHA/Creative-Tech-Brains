import 'controller/los_controller.dart';
import 'package:flutter/material.dart';
import 'package:hiw/core/app_export.dart';
import 'package:hiw/widgets/custom_button.dart';

class LosScreen extends GetWidget<LosController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
            backgroundColor: ColorConstant.blueA700,
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 70, 0, 200),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: CustomImageView(
                                imagePath:
                                    ImageConstant.imgScreenshot2023030647x82,
                                height: getVerticalSize(47),
                                width: getHorizontalSize(82),
                              ),
                            )),
                      ),
                      Column(
                        children: [
                          Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                  padding: getPadding(left: 33, bottom: 50),
                                  child: Text("msg_health_is_wealth".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsSemiBold35))),
                          CustomButton(
                              height: getVerticalSize(60),
                              text: "lbl_log_in".tr,
                              margin: getMargin(left: 33, top: 27, right: 36),
                              fontStyle: ButtonFontStyle.PoppinsExtraBold29,
                              onTap: onTapLogin),
                          CustomButton(
                              height: getVerticalSize(60),
                              text: "lbl_sign_up".tr,
                              margin: getMargin(
                                  left: 33, top: 20, right: 36, bottom: 5),
                              variant: ButtonVariant.OutlineWhiteA700,
                              onTap: onTapSignup)
                        ],
                      )
                    ]))));
  }

  onTapLogin() {
    Get.toNamed(AppRoutes.loginScreen);
  }

  onTapSignup() {
    Get.toNamed(AppRoutes.signUpScreen);
  }
}
