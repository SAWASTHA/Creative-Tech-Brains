import 'package:flutter/cupertino.dart';

import '../../repository/user repository/user_repository.dart';
import '../userinfo.dart';
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
import 'package:dob_input_field/dob_input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

DatabaseReference ref = FirebaseDatabase.instance.ref();

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _nameState();
}

class _nameState extends State<SignUpScreen> {
  Createuser() async {
    try {
      if (ConfirmPassword()) {
        var user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: c2.text.trim(), password: c3.text.trim())
            .then((value) => {onTapImgHome()});

        addUserDetails(
          c1.text.trim(),
          c2.text.trim(),
          c5.text.trim(),
          c6.text.trim(),
          a.trim(),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        Fluttertoast.showToast(msg: "password is weak");
      } else if (e.code == "email-already-in-use") {
        Fluttertoast.showToast(msg: "email already exists");
      }
    }
  }

  bool ConfirmPassword() {
    if (c3.text.trim() == c4.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  var db = FirebaseFirestore.instance;

  Future addUserDetails(String name, String email, String number,
      String address, String birthday) async {
    var userr = db.collection("users");
    // await FirebaseFirestore.instance.collection("users").add({
    //   "Name": name,
    //   "Email": email,
    //   "Number": number,
    //   "Address": address,
    //   "Birthday": birthday,
    // });
    final data1 = <String, dynamic>{
      "Name": name,
      "Email": email,
      "Number": number,
      "Address": address,
      "Birthday": birthday,
    };
    userr.doc(email).set(data1);
  }

  TextEditingController c1 = new TextEditingController();
  TextEditingController c2 = new TextEditingController();
  TextEditingController c3 = new TextEditingController();
  TextEditingController c4 = new TextEditingController();
  TextEditingController c5 = new TextEditingController();
  TextEditingController c6 = new TextEditingController();
  TextEditingController c7 = new TextEditingController();

  @override
  void dispose() {
    c1.dispose();
    c2.dispose();
    c3.dispose();
    c4.dispose();
    c5.dispose();
    c6.dispose();
    super.dispose();
  }

  DateTime? d1 = DateTime.now();
  String a = "Birthday Date";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.blueA700,
            appBar: CustomAppBar(
                height: getVerticalSize(65),
                title: Container(
                    alignment: Alignment.centerLeft,
                    margin: getMargin(left: 36),
                    child: Stack(alignment: Alignment.centerLeft, children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              height: getVerticalSize(42),
                              width: getHorizontalSize(46),
                              decoration: BoxDecoration(
                                  color: ColorConstant.whiteA700,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(23))))),
                      AppbarImage(
                          height: getSize(28),
                          width: getSize(28),
                          svgPath: ImageConstant.imgArrowleft,
                          margin:
                              getMargin(left: 9, top: 7, right: 9, bottom: 7),
                          onTap: onTapArrowleft1)
                    ])),
                actions: [
                  AppbarImage(
                      height: getVerticalSize(42),
                      width: getHorizontalSize(76),
                      imagePath: ImageConstant.imgScreenshot2023030642x76,
                      margin: getMargin(left: 36, right: 36, bottom: 3))
                ]),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              margin: getMargin(bottom: 4),
                                              padding: getPadding(bottom: 41),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        width:
                                                            getHorizontalSize(
                                                                175),
                                                        margin:
                                                            getMargin(top: 71),
                                                        child: Text(
                                                            "lbl_create_account"
                                                                .tr,
                                                            maxLines: null,
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: AppStyle
                                                                .txtPoppinsSemiBold41)),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          margin: getMargin(
                                                              bottom: 10,
                                                              top: 20),
                                                          height:
                                                              getVerticalSize(
                                                                  60),
                                                          width:
                                                              getHorizontalSize(
                                                                  359),
                                                          child: TextFormField(
                                                            controller: c1,
                                                            textAlign:
                                                                TextAlign.left,
                                                            textAlignVertical:
                                                                TextAlignVertical
                                                                    .bottom,
                                                            style: AppStyle
                                                                .txtRobotoRegular20,
                                                            textInputAction:
                                                                null,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  "Enter Name",
                                                              hintStyle: AppStyle
                                                                  .txtRobotoRegular20,
                                                              filled: true,
                                                              fillColor:
                                                                  Colors.white,
                                                              prefixIcon:
                                                                  Container(
                                                                margin:
                                                                    getMargin(
                                                                  left: 15,
                                                                  right: 25,
                                                                ),
                                                                child: Icon(
                                                                  Icons.person,
                                                                  color: Colors
                                                                      .black,
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
                                                              getVerticalSize(
                                                                  60),
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
                                                            // focusNode: FocusNode(),
                                                            textInputAction:
                                                                null,
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
                                                                margin:
                                                                    getMargin(
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
                                                              getVerticalSize(
                                                                  60),
                                                          width:
                                                              getHorizontalSize(
                                                                  359),
                                                          child: TextField(
                                                            obscureText: true,
                                                            controller: c3,
                                                            textAlign:
                                                                TextAlign.left,
                                                            textAlignVertical:
                                                                TextAlignVertical
                                                                    .bottom,
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
                                                                margin:
                                                                    getMargin(
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
                                                        Container(
                                                          margin: getMargin(
                                                              bottom: 10,
                                                              top: 20),
                                                          height:
                                                              getVerticalSize(
                                                                  60),
                                                          width:
                                                              getHorizontalSize(
                                                                  359),
                                                          child: TextField(
                                                            obscureText: true,
                                                            controller: c4,
                                                            textAlign:
                                                                TextAlign.left,
                                                            textAlignVertical:
                                                                TextAlignVertical
                                                                    .bottom,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  "Confirm Password",
                                                              hintStyle: AppStyle
                                                                  .txtRobotoRegular20,
                                                              filled: true,
                                                              fillColor:
                                                                  Colors.white,
                                                              prefixIcon:
                                                                  Container(
                                                                margin:
                                                                    getMargin(
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
                                                        Container(
                                                          margin: getMargin(
                                                              bottom: 10,
                                                              top: 20),
                                                          height:
                                                              getVerticalSize(
                                                                  60),
                                                          width:
                                                              getHorizontalSize(
                                                                  359),
                                                          child: TextField(
                                                            controller: c5,
                                                            textAlign:
                                                                TextAlign.left,
                                                            textAlignVertical:
                                                                TextAlignVertical
                                                                    .bottom,
                                                            style: AppStyle
                                                                .txtRobotoRegular20,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  "Enter Number",
                                                              hintStyle: AppStyle
                                                                  .txtRobotoRegular20,
                                                              filled: true,
                                                              fillColor:
                                                                  Colors.white,
                                                              prefixIcon:
                                                                  Container(
                                                                      margin:
                                                                          getMargin(
                                                                        left:
                                                                            15,
                                                                        right:
                                                                            20,
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .phone,
                                                                        color: Colors
                                                                            .black,
                                                                        size:
                                                                            30,
                                                                      )),
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
                                                              getVerticalSize(
                                                                  60),
                                                          width:
                                                              getHorizontalSize(
                                                                  359),
                                                          child: TextField(
                                                            maxLines: 1,
                                                            controller: c6,
                                                            textAlign:
                                                                TextAlign.left,
                                                            textAlignVertical:
                                                                TextAlignVertical
                                                                    .center,
                                                            style: AppStyle
                                                                .txtRobotoRegular20,
                                                            textInputAction:
                                                                null,
                                                            decoration:
                                                                InputDecoration(
                                                              hintText:
                                                                  "Enter Address",
                                                              hintStyle: AppStyle
                                                                  .txtRobotoRegular20,
                                                              filled: true,
                                                              fillColor:
                                                                  Colors.white,
                                                              prefixIcon:
                                                                  Container(
                                                                      margin:
                                                                          getMargin(
                                                                        left:
                                                                            15,
                                                                        right:
                                                                            20,
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .home,
                                                                        color: Colors
                                                                            .black,
                                                                        size:
                                                                            30,
                                                                      )),
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .txtRoundedBorder17),
                                                            ),
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
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadiusStyle
                                                                            .txtRoundedBorder17),
                                                            child: InkWell(
                                                                onTap: () {
                                                                  FocusScopeNode
                                                                      currentFocus =
                                                                      FocusScope.of(
                                                                          context);

                                                                  if (!currentFocus
                                                                      .hasPrimaryFocus) {
                                                                    currentFocus
                                                                        .unfocus();
                                                                  }
                                                                  showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate: DateTime
                                                                              .now(),
                                                                          firstDate: DateTime(
                                                                              2000),
                                                                          lastDate: DateTime(
                                                                              2032))
                                                                      .then(
                                                                          (value) {
                                                                    setState(
                                                                        () {
                                                                      d1 =
                                                                          value;
                                                                      a = "${d1!.year.toString()}-${d1!.month.toString().padLeft(2, '0')}-${d1!.day.toString().padLeft(2, '0')}"
                                                                          .toString();
                                                                    });
                                                                  });
                                                                }, // Handle your callback
                                                                child: Text(
                                                                  "$a",
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: AppStyle
                                                                      .txtPoppinsExtraBold30,
                                                                ))),
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
                                                                  Createuser();
                                                                }, // Handle your callback
                                                                child: Text(
                                                                  "lbl_sign_up"
                                                                      .tr,
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
                                                    Spacer(),
                                                  ]))),
                                    ])),
                          ]))
                ],
              ),
            )));
  }

  onTapArrowleft1() {
    Get.back();
  }

  onTapImgHome() {
    Get.toNamed(AppRoutes.homeScreen);
  }
}
