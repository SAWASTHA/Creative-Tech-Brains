import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hiw/core/app_export.dart';

class calander extends StatefulWidget {
  // const calander({super.key});

  @override
  State<calander> createState() => _calanderState();
}

class _calanderState extends State<calander> {
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
              ])),
          bottomNavigationBar: Container(
              height: getVerticalSize(190),
              width: MediaQuery.of(context).size.width,
              child: Stack(alignment: Alignment.topRight, children: [
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        height: getVerticalSize(82),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: ColorConstant.blue800,
                            borderRadius:
                                BorderRadius.circular(getHorizontalSize(28))))),
                CustomImageView(
                    svgPath: ImageConstant.imgGroup7,
                    height: getVerticalSize(88),
                    width: getHorizontalSize(114),
                    alignment: Alignment.centerRight,
                    margin: getMargin(right: 86, top: 20)),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: getPadding(left: 34, right: 202, top: 100),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgHome,
                                  height: getSize(35),
                                  width: getSize(35),
                                  margin: getMargin(top: 8),
                                  onTap: () {
                                    onTapImgHome();
                                  }),
                              Spacer(flex: 50),
                              CustomImageView(
                                  svgPath: ImageConstant.imgLocation,
                                  height: getVerticalSize(34),
                                  width: getHorizontalSize(27),
                                  onTap: () {
                                    onTapImgLocation();
                                  }),
                              Spacer(flex: 49),
                              CustomImageView(
                                  svgPath: ImageConstant.imgSearch,
                                  height: getVerticalSize(32),
                                  width: getHorizontalSize(34),
                                  margin: getMargin(top: 2),
                                  onTap: () {
                                    onTapImgSearch();
                                  })
                            ]))),
                CustomImageView(
                    svgPath: ImageConstant.imgCalendar,
                    height: getVerticalSize(32),
                    width: getHorizontalSize(34),
                    alignment: Alignment.centerRight,
                    margin: getMargin(right: 126)),
                CustomImageView(
                    svgPath: ImageConstant.imgUser,
                    height: getVerticalSize(35),
                    width: getHorizontalSize(30),
                    alignment: Alignment.centerRight,
                    margin: getMargin(top: 100, right: 46),
                    onTap: () {
                      onTapImgUser();
                    })
              ])),
        )));
  }

  onTapImgHome() {
    Get.toNamed(AppRoutes.homeScreen);
  }

  onTapImgLocation() {
    Get.toNamed(AppRoutes.mapsScreen);
  }

  onTapImgSearch() {
    Get.toNamed(AppRoutes.searchScreen);
  }

  onTapImgUser() {
    Get.toNamed(AppRoutes.profileScreen);
  }
}
