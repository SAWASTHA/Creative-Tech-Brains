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
    return WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
            top: false,
            child: Scaffold(
                backgroundColor: Colors.white,
                body: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // ElevatedButton(
                          //     onPressed: () {
                          //       FirebaseAuth.instance
                          //           .signOut()
                          //           .then((value) => onTapLogin());
                          //     },
                          //     child: Text("logout")),
                          Container(
                              width: double.maxFinite,
                              child: Container(
                                  padding: getPadding(
                                      left: 21, top: 45, right: 21, bottom: 45),
                                  decoration: AppDecoration.fillBlueA700
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder34),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                            svgPath:
                                                ImageConstant.imgArrowleft2,
                                            height: getSize(44),
                                            width: getSize(44),
                                            onTap: () {
                                              onTapImgCalendar();
                                            }),
                                        Padding(
                                            padding:
                                                getPadding(left: 9, top: 4),
                                            child: Text("Profile".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsExtraBold29)),
                                        Padding(
                                            padding: getPadding(
                                                left: 9,
                                                top: 8,
                                                right: 1,
                                                bottom: 19),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      height:
                                                          getVerticalSize(110),
                                                      width: getHorizontalSize(
                                                          129),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      14)),
                                                          border: Border.all(
                                                              color:
                                                                  ColorConstant
                                                                      .whiteA700,
                                                              width:
                                                                  getHorizontalSize(
                                                                      3),
                                                              strokeAlign:
                                                                  BorderSide
                                                                      .strokeAlignOutside))),
                                                  Container(
                                                      width: getHorizontalSize(
                                                          220),
                                                      margin: getMargin(
                                                          top: 1, bottom: 3),
                                                      child: Text(
                                                          "Rohit waghmare".tr,
                                                          maxLines: null,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPoppinsExtraBold37))
                                                ]))
                                      ]))),

                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: getPadding(left: 29, top: 43),
                                    child: Text("Email Address".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsMedium16)),
                                Padding(
                                    padding: getPadding(left: 29, top: 6),
                                    child: Text(
                                      "rohit98waghmare@gmail.com".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtPoppinsBold18,
                                    )),
                                Padding(
                                    padding: getPadding(left: 29, top: 20),
                                    child: Text("phone number".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsMedium16)),
                                Padding(
                                    padding: getPadding(left: 30, top: 6),
                                    child: Text("9146585763".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsBold18)),
                                Padding(
                                    padding: getPadding(left: 29, top: 20),
                                    child: Text("Address".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsMedium16)),
                                Container(
                                  width: getHorizontalSize(312),
                                  margin: getMargin(left: 30, top: 6),
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                          "Sangram nagar, satara Parisar, Aurangabad"
                                              .tr,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtPoppinsBold18)),
                                )
                              ],
                            ),
                          ),
                          Padding(
                              padding: getPadding(left: 29, top: 10),
                              child: Row(children: [
                                CustomImageView(
                                    svgPath: ImageConstant.imgEdit,
                                    height: getSize(25),
                                    width: getSize(25),
                                    margin: getMargin(top: 8, bottom: 4)),
                                Padding(
                                    padding: getPadding(left: 23),
                                    child: Text("Edit profile".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtPoppinsBold25))
                              ])),
                          Padding(
                              padding: getPadding(left: 29, top: 1),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgVolume,
                                        height: getVerticalSize(23),
                                        width: getHorizontalSize(31),
                                        margin: getMargin(top: 10)),
                                    Padding(
                                        padding: getPadding(left: 17),
                                        child: InkWell(
                                            onTap: () {
                                              FirebaseAuth.instance
                                                  .signOut()
                                                  .then(
                                                      (value) => onTapLogin());
                                            },
                                            child: Text("Sign Out".tr,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtPoppinsBold25RedA700)))
                                  ])),

                          Container(
                              height: getVerticalSize(128),
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                            height: getVerticalSize(91),
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                                color: ColorConstant.blue800,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        getHorizontalSize(
                                                            28))))),
                                    CustomImageView(
                                        svgPath: ImageConstant.imgGroup7,
                                        height: getVerticalSize(70),
                                        width: getHorizontalSize(114),
                                        alignment: Alignment.topRight,
                                        margin:
                                            getMargin(right: 4, bottom: 59)),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding: getPadding(
                                              left: 34,
                                              right: 125,
                                            ),
                                            child: Row(children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgHome,
                                                  height: getSize(35),
                                                  width: getSize(35),
                                                  margin: getMargin(top: 20),
                                                  onTap: () {
                                                    onTapImgHome();
                                                  }),
                                              Spacer(flex: 50),
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgLocation,
                                                  height: getVerticalSize(34),
                                                  width: getHorizontalSize(27),
                                                  margin: getMargin(top: 20),
                                                  onTap: () {
                                                    onTapImgLocation();
                                                  }),
                                              Spacer(flex: 49),
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgSearch,
                                                  height: getVerticalSize(32),
                                                  width: getHorizontalSize(34),
                                                  margin: getMargin(top: 20),
                                                  onTap: () {
                                                    onTapImgSearch();
                                                  }),
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgCalendar,
                                                  height: getVerticalSize(32),
                                                  width: getHorizontalSize(34),
                                                  margin: getMargin(
                                                      left: 42, top: 20),
                                                  onTap: () {
                                                    onTapImgCalendar();
                                                  })
                                            ]))),
                                    CustomImageView(
                                        svgPath: ImageConstant.imgUser,
                                        height: getVerticalSize(35),
                                        width: getHorizontalSize(30),
                                        alignment: Alignment.topRight,
                                        margin: getMargin(right: 46, top: 7))
                                  ]))
                        ])))));
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
