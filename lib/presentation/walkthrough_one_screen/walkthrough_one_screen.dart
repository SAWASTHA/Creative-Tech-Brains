import 'controller/walkthrough_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:hiw/core/app_export.dart';
import 'package:hiw/widgets/app_bar/custom_app_bar.dart';

class WalkthroughOneScreen extends StatefulWidget {
  // const WalkthroughOneScreen({super.key});

  @override
  State<WalkthroughOneScreen> createState() => _nameState();
}

class _nameState extends State<WalkthroughOneScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: ColorConstant.indigo800,
          body: InkWell(
            onTap: () {
              onTapLogin();
            }, // Handle your callback
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: getPadding(
                top: 36,
                bottom: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: getMargin(
                      left: 21,
                    ),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgEllipse1,
                                  height: getVerticalSize(
                                    630,
                                  ),
                                  width: getHorizontalSize(
                                    334,
                                  ),
                                  alignment: Alignment.centerRight,
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant.imgImage1,
                                  height: getVerticalSize(
                                    350,
                                  ),
                                  width: getHorizontalSize(
                                    350,
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                              ],
                            ),
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgScreenshot2023030638x67,
                          height: getVerticalSize(
                            38,
                          ),
                          width: getHorizontalSize(
                            67,
                          ),
                          alignment: Alignment.topLeft,
                          margin: getMargin(
                            top: 52,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 20,
                      top: 0,
                    ),
                    child: Text(
                      "lbl_communication".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsSemiBold40,
                    ),
                  ),
                  Container(
                    width: getHorizontalSize(
                      240,
                    ),
                    margin: getMargin(
                      left: 20,
                    ),
                    child: Text(
                      "msg_easy_communication".tr,
                      maxLines: null,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPoppinsSemiBold18,
                    ),
                  ),
                  Spacer(),
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
                          value: 0.35,
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
    Get.toNamed(AppRoutes.walkthroughTwoScreen);
  }
}
