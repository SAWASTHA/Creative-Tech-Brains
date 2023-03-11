import 'package:flutter/material.dart';
import 'package:hiw/core/app_export.dart';

class Mapp extends StatefulWidget {
  @override
  State<Mapp> createState() => _MappState();
}

class _MappState extends State<Mapp> {
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
                      Spacer(),
                      Container(
                          height: getVerticalSize(208),
                          width: MediaQuery.of(context).size.width,
                          child: Stack(alignment: Alignment.topLeft, children: [
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
                                alignment: Alignment.centerLeft,
                                margin: getMargin(left: 68, top: 20)),
                            CustomImageView(
                                svgPath: ImageConstant.imgHome,
                                height: getSize(35),
                                width: getSize(35),
                                alignment: Alignment.centerLeft,
                                margin: getMargin(left: 34, top: 100),
                                onTap: () {
                                  onTapImgHome();
                                }),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                    padding: getPadding(right: 46),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgLocation,
                                              height: getVerticalSize(34),
                                              width: getHorizontalSize(27),
                                              // alignment: Alignment.centerLeft,
                                              margin: getMargin(
                                                  right: 55, bottom: 50)),
                                          CustomImageView(
                                              svgPath: ImageConstant.imgSearch,
                                              height: getVerticalSize(32),
                                              width: getHorizontalSize(34),
                                              margin: getMargin(top: 100),
                                              onTap: () {
                                                onTapImgSearch();
                                              }),
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgCalendar,
                                              height: getVerticalSize(32),
                                              width: getHorizontalSize(34),
                                              margin: getMargin(left: 45),
                                              onTap: () {
                                                onTapImgCalendar();
                                              }),
                                          CustomImageView(
                                              svgPath: ImageConstant.imgUser,
                                              height: getVerticalSize(35),
                                              width: getHorizontalSize(30),
                                              margin: getMargin(
                                                left: 45,
                                              ),
                                              onTap: () {
                                                onTapImgUser();
                                              })
                                        ]))),
                          ]))
                    ]))));
  }

  onTapImgHome() {
    Get.toNamed(AppRoutes.homeScreen);
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
}
