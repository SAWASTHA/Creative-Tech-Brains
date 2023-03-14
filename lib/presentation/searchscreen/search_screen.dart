import 'dart:io';

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hiw/core/app_export.dart';

class search extends StatefulWidget {
  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Back again to close the app");
      return Future.value(false);
    }
    return Future.value(exit(0));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: ColorConstant.black900,
          body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Spacer(),
                Container(
                    height: getVerticalSize(208),
                    width: MediaQuery.of(context).size.width,
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              height: getVerticalSize(91),
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  color: ColorConstant.blue800,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(28))))),
                      CustomImageView(
                          svgPath: ImageConstant.imgGroup7,
                          height: getVerticalSize(88),
                          width: getHorizontalSize(114),
                          alignment: Alignment.center,
                          margin: getMargin(top: 20)),
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                              padding: getPadding(left: 34, top: 100),
                              child: Row(children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgHome,
                                    height: getSize(35),
                                    width: getSize(35),
                                    onTap: () {
                                      onTapImgHome();
                                    }),
                                CustomImageView(
                                    svgPath: ImageConstant.imgLocation,
                                    height: getVerticalSize(34),
                                    width: getHorizontalSize(27),
                                    margin: getMargin(left: 52),
                                    onTap: () {
                                      onTapImgLocation();
                                    })
                              ]))),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: getPadding(top: 100, right: 46),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgCalendar,
                                        height: getVerticalSize(32),
                                        width: getHorizontalSize(34),
                                        margin: getMargin(top: 2),
                                        onTap: () {
                                          onTapImgCalendar();
                                        }),
                                    CustomImageView(
                                        svgPath: ImageConstant.imgUser,
                                        height: getVerticalSize(35),
                                        width: getHorizontalSize(30),
                                        margin: getMargin(left: 48),
                                        onTap: () {
                                          onTapImgUser();
                                        })
                                  ]))),
                      CustomImageView(
                          svgPath: ImageConstant.imgSearch,
                          height: getVerticalSize(32),
                          width: getHorizontalSize(34),
                          alignment: Alignment.topCenter,
                          margin: getMargin(top: 85))
                    ]))
              ])),
        )));
  }

  onTapImgHome() {
    Get.toNamed(AppRoutes.homeScreen);
  }

  onTapImgLocation() {
    Get.toNamed(AppRoutes.mapsScreen);
  }

  onTapImgCalendar() {
    Get.toNamed(AppRoutes.calanderScreen);
  }

  onTapImgUser() {
    Get.toNamed(AppRoutes.profileScreen);
  }
}
