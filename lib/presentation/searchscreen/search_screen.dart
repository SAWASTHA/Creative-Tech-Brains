import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hiw/core/app_export.dart';
import 'package:hiw/presentation/hospitalData/hospitalDataa.dart';

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
            top: false,
            child: Scaffold(
              backgroundColor: ColorConstant.whiteA700,
              body: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: getPadding(
                            left: 30,
                            top: 86,
                          ),
                          child: Text(
                            "Search",
                            style: AppStyle.search,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: getMargin(left: 20, top: 20, right: 30),
                        padding: getPadding(right: 20, left: 20),
                        decoration: AppDecoration.fillLightblue900.copyWith(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: InkWell(
                          onTap: () {
                            onTapDoctor();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 102,
                                  bottom: 17,
                                ),
                                child: Text(
                                  "Doctors",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsSemiBold35,
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgImage4,
                                height: getVerticalSize(
                                  154,
                                ),
                                width: getHorizontalSize(
                                  77,
                                ),
                                margin: getMargin(
                                  top: 12,
                                  right: 58,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: getMargin(left: 20, top: 20, right: 30),
                        decoration: AppDecoration.fillPink300.copyWith(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: InkWell(
                          onTap: () {
                            onTapHospital();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: getPadding(
                                  left: 5,
                                  top: 106,
                                  bottom: 13,
                                ),
                                child: Text(
                                  "Hospitals",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsSemiBold35,
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.hospital,
                                height: getVerticalSize(
                                  81,
                                ),
                                width: getHorizontalSize(
                                  174,
                                ),
                                margin: getMargin(
                                  top: 88,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: getMargin(left: 20, top: 20, right: 30),
                        padding: getPadding(right: 20, left: 20),
                        decoration: AppDecoration.fillBlack900.copyWith(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: InkWell(
                          onTap: () {
                            onTapStores();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 103,
                                  bottom: 16,
                                ),
                                child: Text(
                                  "Stores",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsSemiBold35,
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgImage6,
                                height: getVerticalSize(
                                  95,
                                ),
                                width: getHorizontalSize(
                                  157,
                                ),
                                margin: getMargin(
                                  top: 75,
                                  right: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                  height: getVerticalSize(190),
                  width: MediaQuery.of(context).size.width,
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            height: getVerticalSize(82),
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
                        margin: getMargin(top: 77))
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

  onTapHospital() {
    Get.toNamed(AppRoutes.hospitalsearchh);
  }

  onTapDoctor() {
    Get.toNamed(AppRoutes.doctor);
  }

  onTapStores() {
    Get.toNamed(AppRoutes.store);
  }
}
