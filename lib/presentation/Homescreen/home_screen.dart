import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hiw/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hiw/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

DatabaseReference ref = FirebaseDatabase.instance.ref();

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? name;

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
            child: Scaffold(
                backgroundColor: ColorConstant.black900,
                body: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {}, child: Text("$name")),
                          Spacer(),
                          Container(
                              height: getVerticalSize(208),
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                            height: getVerticalSize(91),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                color: ColorConstant.blue800,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        getHorizontalSize(
                                                            28))))),
                                    CustomImageView(
                                        margin: getMargin(top: 20),
                                        imagePath:
                                            ImageConstant.imgGroup7Black900,
                                        height: getVerticalSize(90),
                                        width: getHorizontalSize(114),
                                        alignment: Alignment.centerLeft),
                                    CustomImageView(
                                        svgPath: ImageConstant.imgHome,
                                        height: getSize(35),
                                        width: getSize(35),
                                        alignment: Alignment.centerLeft,
                                        margin: getMargin(left: 40, bottom: 5)),
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                            padding:
                                                getPadding(top: 100, right: 46),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgLocation,
                                                      height:
                                                          getVerticalSize(34),
                                                      width:
                                                          getHorizontalSize(27),
                                                      margin:
                                                          getMargin(right: 40),
                                                      onTap: () {
                                                        onTapImgLocation();
                                                      }),
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgSearch,
                                                      height:
                                                          getVerticalSize(32),
                                                      width:
                                                          getHorizontalSize(34),
                                                      margin: getMargin(top: 5),
                                                      onTap: () {
                                                        onTapImgSearch();
                                                      }),
                                                  CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgCalendar,
                                                      height:
                                                          getVerticalSize(32),
                                                      width:
                                                          getHorizontalSize(34),
                                                      margin: getMargin(
                                                          left: 45, top: 5),
                                                      onTap: () {
                                                        onTapImgCalendar();
                                                      }),
                                                  CustomImageView(
                                                      svgPath:
                                                          ImageConstant.imgUser,
                                                      height:
                                                          getVerticalSize(35),
                                                      width:
                                                          getHorizontalSize(30),
                                                      margin: getMargin(
                                                          left: 45, bottom: 2),
                                                      onTap: () {
                                                        onTapImgUser();
                                                      }),
                                                ]))),
                                  ]))
                        ])))));
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
