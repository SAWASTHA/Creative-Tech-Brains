import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:hiw/core/app_export.dart';
import 'package:hiw/widgets/app_bar/appbar_image.dart';
import 'package:hiw/widgets/app_bar/custom_app_bar.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _nameState();
}

class _nameState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.blueA700,
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: getVerticalSize(719),
                          width: double.maxFinite,
                          child:
                              Stack(alignment: Alignment.topCenter, children: [
                            Align(
                                child: Container(
                                    padding: getPadding(top: 40, bottom: 60),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomAppBar(
                                              height: getVerticalSize(45),
                                              title: Container(
                                                  height: getVerticalSize(42),
                                                  width: getHorizontalSize(46),
                                                  margin: getMargin(left: 36),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Container(
                                                                height:
                                                                    getVerticalSize(
                                                                        42),
                                                                width:
                                                                    getHorizontalSize(
                                                                        46),
                                                                decoration: BoxDecoration(
                                                                    color: ColorConstant
                                                                        .whiteA700,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            getHorizontalSize(23))))),
                                                        AppbarImage(
                                                            height: getSize(28),
                                                            width: getSize(28),
                                                            svgPath: ImageConstant
                                                                .imgArrowleft,
                                                            margin: getMargin(
                                                                left: 9,
                                                                top: 7,
                                                                right: 9,
                                                                bottom: 7),
                                                            onTap:
                                                                onTapArrowleft)
                                                      ])),
                                              actions: [
                                                AppbarImage(
                                                    height: getVerticalSize(40),
                                                    width:
                                                        getHorizontalSize(70),
                                                    imagePath: ImageConstant
                                                        .imgScreenshot2023030640x70,
                                                    margin: getMargin(
                                                        left: 40,
                                                        top: 1,
                                                        right: 40,
                                                        bottom: 1))
                                              ]),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                  width: getHorizontalSize(199),
                                                  margin: getMargin(
                                                      left: 36, top: 70),
                                                  child: Text(
                                                      "lbl_welcome_back".tr,
                                                      maxLines: null,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtPoppinsSemiBold41))),
                                          Spacer(),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                margin: getMargin(
                                                    bottom: 10,
                                                    left: 25,
                                                    top: 20),
                                                height: getVerticalSize(60),
                                                width: getHorizontalSize(359),
                                                child: TextField(
                                                  textAlign: TextAlign.left,
                                                  textAlignVertical:
                                                      TextAlignVertical.top,
                                                  style: AppStyle
                                                      .txtRobotoRegular20,
                                                  textInputAction: null,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    prefixIcon: Container(
                                                      margin: getMargin(
                                                        left: 15,
                                                        right: 25,
                                                      ),
                                                      child: CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgMaill,
                                                      ),
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .txtRoundedBorder17),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: getMargin(
                                                    bottom: 10,
                                                    left: 25,
                                                    top: 20),
                                                height: getVerticalSize(60),
                                                width: getHorizontalSize(359),
                                                child: TextField(
                                                  textAlign: TextAlign.left,
                                                  textAlignVertical:
                                                      TextAlignVertical.top,
                                                  style: AppStyle
                                                      .txtRobotoRegular20,
                                                  textInputAction: null,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    prefixIcon: Container(
                                                      margin: getMargin(
                                                        left: 15,
                                                        right: 25,
                                                      ),
                                                      child: CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgLock,
                                                      ),
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .txtRoundedBorder17),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  width: getHorizontalSize(359),
                                                  margin: getMargin(
                                                      bottom: 5,
                                                      left: 25,
                                                      top: 20),
                                                  padding: getPadding(
                                                      left: 0,
                                                      top: 5,
                                                      right: 0,
                                                      bottom: 5),
                                                  decoration: AppDecoration
                                                      .txtFillBlueA700
                                                      .copyWith(
                                                          color: Color.fromARGB(
                                                              255, 2, 1, 1),
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .txtRoundedBorder17),
                                                  child: InkWell(
                                                      onTap:
                                                          () {}, // Handle your callback
                                                      child: Text(
                                                        "lbl_sign_up".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: AppStyle
                                                            .txtPoppinsExtraBold29,
                                                      ))),
                                            ],
                                          ),
                                        ]))),
                          ])),
                    ]))));
  }

  onTapArrowleft() {
    Get.back();
  }
}
