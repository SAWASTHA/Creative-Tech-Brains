import 'package:get/get_connect/http/src/utils/utils.dart';

import 'controller/walkthrough_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:hiw/core/app_export.dart';

class WalkthroughTwoScreen extends GetWidget<WalkthroughTwoController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: ColorConstant.pinkA100,
          body: InkWell(
            onTap: () {
              onTapLogin();
            }, // Handle your callback
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgEllipse1615x428,
                          height: getVerticalSize(
                            617,
                          ),
                          width: getHorizontalSize(
                            418,
                          ),
                          alignment: Alignment.center,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgImage2,
                          height: getVerticalSize(
                            312,
                          ),
                          width: getHorizontalSize(
                            368,
                          ),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: getMargin(
                        left: 26,
                      ),
                      child: Text(
                        "msg_health_connect".tr,
                        maxLines: null,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPoppinsSemiBold43,
                      ),
                    ),
                  ),
                  Container(
                    width: getHorizontalSize(
                      370,
                    ),
                    margin: getMargin(
                      left: 26,
                      top: 3,
                      right: 31,
                    ),
                    child: Text(
                      "msg_24x7_to_assist_you".tr,
                      maxLines: null,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsSemiBold18,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
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
                          value: 0.55,
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
    Get.toNamed(AppRoutes.walkthroughThreeScreen);
  }
}
