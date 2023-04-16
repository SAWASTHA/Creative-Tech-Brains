import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hiw/core/app_export.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

extension Capitalized on String {
  String capitalized() =>
      this.substring(0, 1).toUpperCase() + this.substring(1).toLowerCase();
}

class profile extends StatefulWidget {
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  DateTime? currentBackPressTime;
  String? name;
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

  File? img;
  var db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    CollectionReference user = db.collection("users");
    return WillPopScope(
        onWillPop: onWillPop,
        child: SafeArea(
            top: false,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: FutureBuilder(
                    future: user.doc(name).get(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        var data = snapshot.data as DocumentSnapshot;
                        return Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      width: double.maxFinite,
                                      child: Container(
                                          padding: getPadding(
                                              left: 21,
                                              top: 55,
                                              right: 21,
                                              bottom: 45),
                                          decoration: AppDecoration.fillBlueA700
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder34),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgArrowleft2,
                                                        height: getSize(44),
                                                        width: getSize(44),
                                                        onTap: () {
                                                          onTapImgCalendar();
                                                        }),
                                                  ],
                                                ),
                                                Padding(
                                                    padding: getPadding(
                                                        left: 9,
                                                        top: 28,
                                                        bottom: 19),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 50,
                                                                backgroundColor:
                                                                    Color.fromARGB(
                                                                        255,
                                                                        255,
                                                                        255,
                                                                        255),
                                                                child: CircleAvatar(
                                                                    radius:
                                                                        47.0,
                                                                    backgroundImage:
                                                                        NetworkImage(
                                                                            data['profileURL'])),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                              width:
                                                                  getHorizontalSize(
                                                                      220),
                                                              margin: getMargin(
                                                                  left: 20,
                                                                  top: 1,
                                                                  bottom: 3),
                                                              child: Text(
                                                                  "${data['Name']}"
                                                                      .capitalized(),
                                                                  maxLines:
                                                                      null,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtPoppinsSemiBold40))
                                                        ]))
                                              ]))),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding:
                                                getPadding(left: 29, top: 10),
                                            child: Row(children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgMaill,
                                                  height: getSize(30),
                                                  width: getSize(30),
                                                  margin: getMargin(top: 35)),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 29, top: 43),
                                                      child: Text(
                                                          "Email Address".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPoppinsMedium16)),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 29, top: 6),
                                                      child: Text(
                                                        "${name}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .txtPoppinsBold18,
                                                      )),
                                                ],
                                              ),
                                            ])),
                                        Padding(
                                            padding:
                                                getPadding(left: 25, top: 10),
                                            child: Row(children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 15,
                                                ),
                                                child: Icon(
                                                  Icons.phone_android_sharp,
                                                  size: 30,
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 29, top: 20),
                                                      child: Text(
                                                          "phone number".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPoppinsMedium16)),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 30, top: 6),
                                                      child: Text(
                                                          "${data['Number']}",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPoppinsBold18)),
                                                ],
                                              ),
                                            ])),
                                        Padding(
                                            padding:
                                                getPadding(left: 25, top: 10),
                                            child: Row(children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 15),
                                                child: Icon(
                                                  Icons.location_city,
                                                  size: 30,
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 29, top: 20),
                                                      child: Text("Address".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPoppinsMedium16)),
                                                  Padding(
                                                      padding: getPadding(),
                                                      child: Container(
                                                        width:
                                                            getHorizontalSize(
                                                                312),
                                                        margin: getMargin(
                                                            left: 30, top: 6),
                                                        child: SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Text(
                                                                "${data['Address']}",
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtPoppinsBold18)),
                                                      )),
                                                ],
                                              ),
                                            ])),
                                        Padding(
                                            padding:
                                                getPadding(left: 25, top: 10),
                                            child: Row(children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 15),
                                                child: Icon(
                                                  Icons.cake,
                                                  size: 30,
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 29, top: 20),
                                                      child: Text("Birthday",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .txtPoppinsMedium16)),
                                                  Padding(
                                                      padding: getPadding(),
                                                      child: Container(
                                                        width:
                                                            getHorizontalSize(
                                                                312),
                                                        margin: getMargin(
                                                            left: 30, top: 6),
                                                        child: SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Text(
                                                                "${data['Birthday']}" ==
                                                                        null
                                                                    ? Text(
                                                                        "select Date")
                                                                    : data[
                                                                        'Birthday'],
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: AppStyle
                                                                    .txtPoppinsBold18)),
                                                      )),
                                                ],
                                              ),
                                            ])),
                                        Padding(
                                            padding:
                                                getPadding(left: 30, top: 40),
                                            child: Row(children: [
                                              CustomImageView(
                                                svgPath: ImageConstant.imgEdit,
                                                height: getSize(25),
                                                width: getSize(25),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          getPadding(left: 38),
                                                      child: InkWell(
                                                        onTap: () {
                                                          onTapEdit();
                                                        },
                                                        child: Text(
                                                            "Edit profile".tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsMedium16),
                                                      ))
                                                ],
                                              ),
                                            ])),
                                        Padding(
                                            padding:
                                                getPadding(left: 30, top: 30),
                                            child: Row(children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgVolume,
                                                  height: getVerticalSize(25),
                                                  width: getHorizontalSize(25),
                                                  margin: getMargin(top: 5)),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                      padding:
                                                          getPadding(left: 37),
                                                      child: InkWell(
                                                          onTap: () {
                                                            FirebaseAuth
                                                                .instance
                                                                .signOut()
                                                                .then((value) =>
                                                                    onTapLogin());
                                                          },
                                                          child: Text(
                                                              "Sign Out".tr,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtPoppinsBold25RedA7000)))
                                                ],
                                              ),
                                            ])),
                                      ],
                                    ),
                                  ),
                                ]));
                      }
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: Colors.black,
                              strokeWidth: 5,
                            )
                          ],
                        ),
                      );
                    })),
              ),
              bottomNavigationBar: Container(
                  height: getVerticalSize(128),
                  width: MediaQuery.of(context).size.width,
                  child: Stack(alignment: Alignment.topRight, children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            height: getVerticalSize(81),
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: ColorConstant.blue800,
                                borderRadius: BorderRadius.circular(
                                    getHorizontalSize(28))))),
                    CustomImageView(
                        svgPath: ImageConstant.imgGroup7,
                        height: getVerticalSize(88),
                        width: getHorizontalSize(114),
                        alignment: Alignment.topRight,
                        margin: getMargin(
                          right: 4,
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: getPadding(left: 34, right: 125, top: 20),
                            child: Row(children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgHome,
                                  height: getSize(35),
                                  width: getSize(35),
                                  margin: getMargin(top: 20),
                                  onTap: () {
                                    onTapImgHome();
                                  }),
                              Spacer(flex: 50),
                              CustomImageView(
                                  svgPath: ImageConstant.imgLocation,
                                  height: getVerticalSize(34),
                                  width: getHorizontalSize(27),
                                  margin: getMargin(top: 20),
                                  onTap: () {
                                    onTapImgLocation();
                                  }),
                              Spacer(flex: 49),
                              CustomImageView(
                                  svgPath: ImageConstant.imgSearch,
                                  height: getVerticalSize(32),
                                  width: getHorizontalSize(34),
                                  margin: getMargin(top: 20),
                                  onTap: () {
                                    onTapImgSearch();
                                  }),
                              CustomImageView(
                                  svgPath: ImageConstant.imgCalendar,
                                  height: getVerticalSize(32),
                                  width: getHorizontalSize(34),
                                  margin: getMargin(left: 42, top: 20),
                                  onTap: () {
                                    onTapImgCalendar();
                                  })
                            ]))),
                    CustomImageView(
                        svgPath: ImageConstant.imgUser,
                        height: getVerticalSize(35),
                        width: getHorizontalSize(30),
                        alignment: Alignment.topRight,
                        margin: getMargin(right: 46, top: 15))
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

  onTapImgCalendar() {
    Get.toNamed(AppRoutes.calanderScreen);
  }

  onTapLogin() {
    Get.toNamed(AppRoutes.loginScreen);
  }

  onTapEdit() {
    Get.toNamed(AppRoutes.editprofilescreen);
  }
}
