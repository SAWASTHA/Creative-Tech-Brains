import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hiw/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hiw/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../widgets/app_bar/appbar2.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../userinfo.dart';

DatabaseReference ref = FirebaseDatabase.instance.ref();

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  String? name;

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
  void initState() {
    super.initState();
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        name = currentUser.email;
      }
    } catch (e) {}
  }

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop,
        child: SafeArea(
            top: false,
            child: Scaffold(
              backgroundColor: ColorConstant.whiteA700,
              appBar: CustomAppBar2(
                height: getVerticalSize(
                  80,
                ),
                title: Padding(
                  padding: getPadding(
                    left: 23,
                    top: 0,
                    bottom: 10,
                  ),
                  child: Row(
                    children: [
                      AppbarTitle(
                        text: "Hello",
                        margin: getMargin(top: 2, bottom: 2),
                      ),
                      AppbarTitle(
                        text: "Rohit 👋🏼",
                        margin: getMargin(
                          left: 8,
                          bottom: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  CustomImageView(
                    svgPath: ImageConstant.imgAlarm,
                    height: getVerticalSize(
                      29,
                    ),
                    width: getHorizontalSize(
                      25,
                    ),
                    margin: getMargin(
                      left: 25,
                      top: 0,
                      right: 20,
                      bottom: 10,
                    ),
                  ),
                ],
                styleType: Style.bgFillBlue800,
              ),
              body: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: FutureBuilder(
                          builder: (context, snapshot) {
                            return ListView.builder(
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(""),
                                );
                              },
                            );
                          },
                        )),
                        ElevatedButton(onPressed: () {}, child: Text("$name")),
                      ])),
              bottomNavigationBar: Container(
                  height: getVerticalSize(190),
                  width: MediaQuery.of(context).size.width,
                  child: Stack(alignment: Alignment.topLeft, children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            height: getVerticalSize(82),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: ColorConstant.blue800,
                                borderRadius: BorderRadius.circular(
                                    getHorizontalSize(28))))),
                    CustomImageView(
                        svgPath: ImageConstant.imgGroup7,
                        height: getVerticalSize(88),
                        width: getHorizontalSize(114),
                        alignment: Alignment.centerLeft,
                        margin: getMargin(left: 0, top: 20)),
                    CustomImageView(
                        svgPath: ImageConstant.imgHome,
                        height: getSize(35),
                        width: getSize(35),
                        alignment: Alignment.centerLeft,
                        margin: getMargin(left: 40, bottom: 5)),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: getPadding(top: 100, right: 46),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgLocation,
                                      height: getVerticalSize(34),
                                      width: getHorizontalSize(27),
                                      margin: getMargin(right: 40),
                                      onTap: () {
                                        onTapImgLocation();
                                      }),
                                  CustomImageView(
                                      svgPath: ImageConstant.imgSearch,
                                      height: getVerticalSize(32),
                                      width: getHorizontalSize(34),
                                      margin: getMargin(top: 5),
                                      onTap: () {
                                        onTapImgSearch();
                                      }),
                                  CustomImageView(
                                      svgPath: ImageConstant.imgCalendar,
                                      height: getVerticalSize(32),
                                      width: getHorizontalSize(34),
                                      margin: getMargin(left: 45, top: 5),
                                      onTap: () {
                                        onTapImgCalendar();
                                      }),
                                  CustomImageView(
                                      svgPath: ImageConstant.imgUser,
                                      height: getVerticalSize(35),
                                      width: getHorizontalSize(30),
                                      margin: getMargin(left: 45, bottom: 2),
                                      onTap: () {
                                        onTapImgUser();
                                      }),
                                ]))),
                  ])),
            )));
  }

  onTapImgSearch() {
    Get.toNamed(AppRoutes.searchScreen);
  }

  onTapImgCalendar() {
    Get.toNamed(AppRoutes.calanderScreen);
  }

  onTapImgUser() {
    Get.toNamed(AppRoutes.profileScreen);
  }

  onTapImgLocation() {
    Get.toNamed(AppRoutes.mapsScreen);
  }

  onTapLogin() {
    Get.toNamed(AppRoutes.loginScreen);
  }
}
