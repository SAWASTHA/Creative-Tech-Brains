import 'controller/walkthrough_three_controller.dart';
import 'package:flutter/material.dart';
import 'package:hiw/core/app_export.dart';

class WalkthroughThreeScreen extends GetWidget<WalkthroughThreeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: ColorConstant.indigoA400,
          body: InkWell(
            onTap: () {
              onTapLogin();
            }, // Handle your callback
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,s
                children: [
                  Spacer(
                    flex: 5,
                  ),
                  Container(
                    // margin: EdgeInsets.only(top: 50),
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgImage3,
                          height: getVerticalSize(
                            297,
                          ),
                          width: getHorizontalSize(
                            356,
                          ),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex: 1),
                  Padding(
                    padding: getPadding(
                      left: 19,
                      top: 100,
                    ),
                    child: Text(
                      "lbl_daily_updates".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsSemiBold43WhiteA700,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 19,
                      top: 10,
                    ),
                    child: Text(
                      "msg_notifications_and".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsSemiBold18,
                    ),
                  ),
                  Spacer(flex: 3),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      height: getVerticalSize(
                        11,
                      ),
                      width: getHorizontalSize(
                        186,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            getHorizontalSize(
                              6,
                            ),
                          ),
                          topRight: Radius.circular(
                            getHorizontalSize(
                              6,
                            ),
                          ),
                          bottomLeft: Radius.circular(
                            getHorizontalSize(
                              5,
                            ),
                          ),
                          bottomRight: Radius.circular(
                            getHorizontalSize(
                              6,
                            ),
                          ),
                        ),
                        child: LinearProgressIndicator(
                          value: 1,
                          backgroundColor: ColorConstant.whiteA70051,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            ColorConstant.whiteA700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  onTapLogin() {
    Get.toNamed(AppRoutes.losScreen);
  }
}
