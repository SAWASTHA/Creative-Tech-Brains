import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hiw/core/app_export.dart';

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.black900,
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            FirebaseAuth.instance
                                .signOut()
                                .then((value) => onTapLogin());
                          },
                          child: Text("logout")),
                      Spacer(),
                      Container(
                          height: getVerticalSize(208),
                          width: MediaQuery.of(context).size.width,
                          child:
                              Stack(alignment: Alignment.topRight, children: [
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
                                alignment: Alignment.centerRight,
                                margin: getMargin(right: 4, top: 20)),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: getPadding(
                                      left: 34,
                                      top: 100,
                                      right: 125,
                                    ),
                                    child: Row(children: [
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
                                          }),
                                      CustomImageView(
                                          svgPath: ImageConstant.imgCalendar,
                                          height: getVerticalSize(32),
                                          width: getHorizontalSize(34),
                                          margin: getMargin(left: 42, top: 1),
                                          onTap: () {
                                            onTapImgCalendar();
                                          })
                                    ]))),
                            CustomImageView(
                                svgPath: ImageConstant.imgUser,
                                height: getVerticalSize(35),
                                width: getHorizontalSize(30),
                                alignment: Alignment.centerRight,
                                margin: getMargin(right: 46))
                          ]))
                    ]))));
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

  onTapImgCalendar() {
    Get.toNamed(AppRoutes.calanderScreen);
  }

  onTapLogin() {
    Get.toNamed(AppRoutes.loginScreen);
  }
}
