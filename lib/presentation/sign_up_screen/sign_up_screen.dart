import 'controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:hiw/core/app_export.dart';
import 'package:hiw/widgets/app_bar/appbar_image.dart';
import 'package:hiw/widgets/app_bar/custom_app_bar.dart';
import 'package:hiw/widgets/custom_button.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:hiw/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

DatabaseReference ref = FirebaseDatabase.instance.ref();

class SignUpScreen extends GetWidget<SignUpController> {
  Createuser() async {
    try {
      var user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: c2.text, password: c3.text)
          .then((value) => {onTapImgHome()});
      // add() async {
      //   DatabaseReference db = FirebaseDatabase.instance.ref("student/125");
      //   await db.set({"name": c1.text, "email": c2.text, "password": c3.text});
      // }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        Fluttertoast.showToast(msg: "password is weak");
      } else if (e.code == "email-already-in-use") {
        Fluttertoast.showToast(msg: "email already exists");
      }
    }
  }

  TextEditingController c1 = new TextEditingController();
  TextEditingController c2 = new TextEditingController();
  TextEditingController c3 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.blueA700,
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: getVerticalSize(746),
                          width: double.maxFinite,
                          child:
                              Stack(alignment: Alignment.topCenter, children: [
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin: getMargin(bottom: 4),
                                    padding: getPadding(top: 41, bottom: 41),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                ImageConstant.imgGroup5),
                                            fit: BoxFit.cover)),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                                onTapArrowleft1)
                                                      ])),
                                              actions: [
                                                AppbarImage(
                                                    height: getVerticalSize(42),
                                                    width:
                                                        getHorizontalSize(76),
                                                    imagePath: ImageConstant
                                                        .imgScreenshot2023030642x76,
                                                    margin: getMargin(
                                                        left: 36,
                                                        right: 36,
                                                        bottom: 3))
                                              ]),
                                          Container(
                                              width: getHorizontalSize(175),
                                              margin:
                                                  getMargin(left: 36, top: 71),
                                              child: Text(
                                                  "lbl_create_account".tr,
                                                  maxLines: null,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtPoppinsSemiBold41)),
                                          Column(
                                            children: [
                                              Container(
                                                margin: getMargin(
                                                    bottom: 10,
                                                    left: 25,
                                                    top: 20),
                                                height: getVerticalSize(60),
                                                width: getHorizontalSize(359),
                                                child: TextField(
                                                  controller: c1,
                                                  textAlign: TextAlign.left,
                                                  textAlignVertical:
                                                      TextAlignVertical.bottom,
                                                  style: AppStyle
                                                      .txtRobotoRegular20,
                                                  textInputAction: null,
                                                  decoration: InputDecoration(
                                                    hintText: "Enter Name",
                                                    hintStyle: AppStyle
                                                        .txtRobotoRegular20,
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    prefixIcon: Container(
                                                      margin: getMargin(
                                                        left: 15,
                                                        right: 25,
                                                      ),
                                                      child: Icon(
                                                        Icons.person,
                                                        color: Colors.black,
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
                                                  controller: c2,
                                                  textAlign: TextAlign.left,
                                                  textAlignVertical:
                                                      TextAlignVertical.bottom,
                                                  style: AppStyle
                                                      .txtRobotoRegular20,
                                                  // focusNode: FocusNode(),
                                                  textInputAction: null,
                                                  decoration: InputDecoration(
                                                    hintText: "Enter Email",
                                                    hintStyle: AppStyle
                                                        .txtRobotoRegular20,
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
                                                  controller: c3,
                                                  textAlign: TextAlign.left,
                                                  textAlignVertical:
                                                      TextAlignVertical.bottom,
                                                  style: AppStyle
                                                      .txtRobotoRegular20,
                                                  textInputAction: null,
                                                  decoration: InputDecoration(
                                                    hintText: "Enter Password",
                                                    hintStyle: AppStyle
                                                        .txtRobotoRegular20,
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
                                                      onTap: () {
                                                        Createuser();
                                                      }, // Handle your callback
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
                                          Spacer(),
                                        ]))),
                          ])),
                    ]))));
  }

  onTapArrowleft1() {
    Get.back();
  }

  onTapImgHome() {
    Get.toNamed(AppRoutes.homeScreen);
  }
}
