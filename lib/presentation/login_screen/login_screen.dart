import 'package:hiw/presentation/forgot_Password_Screen/forgotpassword.dart';

import 'package:flutter/material.dart';
import 'package:hiw/core/app_export.dart';
import 'package:hiw/widgets/app_bar/appbar_image.dart';
import 'package:hiw/widgets/app_bar/custom_app_bar.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:hiw/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

DatabaseReference ref = FirebaseDatabase.instance.ref();

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _nameState();
}

class _nameState extends State<LoginScreen> {
  loginuser() async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: c1.text.trim(), password: c2.text.trim())
          .then(
        (value) {
          if (FirebaseAuth.instance.currentUser?.uid == null) {
            Fluttertoast.showToast(msg: "user not found");
          } else {
            onTapImgHome();
          }
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: "user not found");
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "password is wrong");
      }
    }
  }

  TextEditingController c1 = new TextEditingController();
  TextEditingController c2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => onTapLos(),
        child: SafeArea(
            top: false,
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: ColorConstant.blueA700,
                body: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: getVerticalSize(719),
                              width: double.maxFinite,
                              child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Align(
                                        child: Container(
                                            padding:
                                                getPadding(top: 40, bottom: 60),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  CustomAppBar(
                                                      height:
                                                          getVerticalSize(45),
                                                      title: Container(
                                                          height:
                                                              getVerticalSize(
                                                                  42),
                                                          width:
                                                              getHorizontalSize(
                                                                  46),
                                                          margin: getMargin(
                                                              left: 36),
                                                          child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              children: [])),
                                                      actions: [
                                                        AppbarImage(
                                                            height:
                                                                getVerticalSize(
                                                                    40),
                                                            width:
                                                                getHorizontalSize(
                                                                    70),
                                                            imagePath: ImageConstant
                                                                .imgScreenshot2023030640x70,
                                                            margin: getMargin(
                                                                left: 40,
                                                                top: 1,
                                                                right: 40,
                                                                bottom: 1))
                                                      ]),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Container(
                                                          width:
                                                              getHorizontalSize(
                                                                  199),
                                                          margin: getMargin(
                                                              left: 36,
                                                              top: 70),
                                                          child: Text(
                                                              "lbl_welcome_back"
                                                                  .tr,
                                                              maxLines: null,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtPoppinsSemiBold41))),
                                                  Spacer(),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Container(
                                                        margin: getMargin(
                                                            bottom: 10,
                                                            top: 10),
                                                        height:
                                                            getVerticalSize(60),
                                                        width:
                                                            getHorizontalSize(
                                                                359),
                                                        child: TextField(
                                                          controller: c1,
                                                          textAlign:
                                                              TextAlign.left,
                                                          textAlignVertical:
                                                              TextAlignVertical
                                                                  .bottom,
                                                          style: AppStyle
                                                              .txtRobotoRegular20,
                                                          textInputAction: null,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                "Enter Email",
                                                            hintStyle: AppStyle
                                                                .txtRobotoRegular20,
                                                            filled: true,
                                                            fillColor:
                                                                Colors.white,
                                                            prefixIcon:
                                                                Container(
                                                              margin: getMargin(
                                                                left: 15,
                                                                right: 25,
                                                              ),
                                                              child:
                                                                  CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
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
                                                            top: 20),
                                                        height:
                                                            getVerticalSize(60),
                                                        width:
                                                            getHorizontalSize(
                                                                359),
                                                        child: TextField(
                                                          controller: c2,
                                                          textAlign:
                                                              TextAlign.left,
                                                          textAlignVertical:
                                                              TextAlignVertical
                                                                  .bottom,
                                                          style: AppStyle
                                                              .txtRobotoRegular20,
                                                          textInputAction: null,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                "Enter Password",
                                                            hintStyle: AppStyle
                                                                .txtRobotoRegular20,
                                                            filled: true,
                                                            fillColor:
                                                                Colors.white,
                                                            prefixIcon:
                                                                Container(
                                                              margin: getMargin(
                                                                left: 15,
                                                                right: 25,
                                                              ),
                                                              child:
                                                                  CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
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
                                                      SizedBox(height: 10),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    38.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) {
                                                                  return forgotPass();
                                                                }));
                                                              },
                                                              child: Text(
                                                                "Forgot Password.?",
                                                                style: AppStyle
                                                                    .txtPoppinsSemiBold18,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                          width:
                                                              getHorizontalSize(
                                                                  359),
                                                          margin: getMargin(
                                                              bottom: 5,
                                                              top: 20),
                                                          padding: getPadding(
                                                              left: 0,
                                                              top: 5,
                                                              right: 0,
                                                              bottom: 5),
                                                          decoration: AppDecoration
                                                              .txtFillBlueA700
                                                              .copyWith(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          2,
                                                                          1,
                                                                          1),
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .txtRoundedBorder17),
                                                          child: InkWell(
                                                              onTap: () {
                                                                loginuser();
                                                              }, // Handle your callback
                                                              child: Text(
                                                                "lbl_log_in".tr,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: AppStyle
                                                                    .txtPoppinsExtraBold29,
                                                              ))),
                                                    ],
                                                  ),
                                                ]))),
                                  ])),
                        ])))));
  }

  onTapLos() async {
    await Get.toNamed(AppRoutes.losScreen);
  }

  onTapImgHome() {
    Get.toNamed(AppRoutes.homeScreen);
  }
}
