import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/custom_image_view.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class editprofile extends StatefulWidget {
  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  String? email;
  @override
  void initState() {
    super.initState();
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        email = currentUser.email;
      }
    } catch (e) {}
  }

  TextEditingController c1 = new TextEditingController();
  TextEditingController c2 = new TextEditingController();
  TextEditingController c3 = new TextEditingController();

  void dispose() {
    c1.dispose();
    c2.dispose();
    c3.dispose();
    super.dispose();
  }

  checkUser() {
    updateUserDetails(
      c1.text.trim(),
      c2.text.trim(),
      c3.text.trim(),
      a.trim(),
    );
  }

  var db = FirebaseFirestore.instance;

  Future updateUserDetails(
      String name, String number, String address, String birthday) async {
    var userr = db.collection("users");
    final data1 = <String, dynamic>{
      "Name": name,
      "Number": number,
      "Address": address,
      "Birthday": birthday,
    };
    userr.doc(email).update(data1);
    onTapImgUser();
    if (image != null) {
      uploadimages();
    }
  }

  DateTime? d1 = DateTime.now();
  String a = "Birthday Date";

  File? image;
  String? downloadURl;
  final imagePicker = ImagePicker();

  Future imagepick() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pick != null) {
        image = File(pick.path);
      } else {
        showSnakBar("No file selected", Duration(microseconds: 400));
      }
    });
  }

  showSnakBar(String snaktext, Duration d) {
    final snakBar = SnackBar(content: Text(snaktext), duration: d);
    ScaffoldMessenger.of(context).showSnackBar(snakBar);
  }

  Widget bottomsheet() {
    return Container(
      color: ColorConstant.indigoA400,
      height: 120,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Text(
            "Choose Profile Photo",
            style: AppStyle.Select,
          ),
          SizedBox(
            height: 15,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton.icon(
                onPressed: () {
                  imagepick();
                },
                icon: Icon(
                  Icons.image,
                  color: Colors.white,
                ),
                label: Text(
                  "Gallery",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ))
          ])
        ],
      ),
    );
  }

  void _settingModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return bottomsheet();
        });
  }

  Future uploadimages() async {
    final postID = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("${email}/image")
        .child("post_$postID");
    await ref.putFile(image!);
    downloadURl = await ref.getDownloadURL();
    var userr = db.collection("users");
    userr.doc(email).update({'profileURL': downloadURl});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: ColorConstant.indigoA400,
              leading: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgArrowleft2,
                            height: getSize(44),
                            width: getSize(44),
                            onTap: () {
                              onTapImgUser();
                            }),
                      ],
                    )
                  ],
                ),
              )),
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
                                            margin: getMargin(top: 50),
                                            padding: getPadding(bottom: 41),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 50,
                                                        backgroundColor:
                                                            Color.fromARGB(255,
                                                                255, 255, 255),
                                                        child: CircleAvatar(
                                                          radius: 47.0,
                                                          backgroundImage: image ==
                                                                  null
                                                              ? AssetImage(
                                                                  "assets/default.jpg")
                                                              : FileImage(
                                                                      image!)
                                                                  as ImageProvider,
                                                        ),
                                                      ),
                                                      Positioned.fill(
                                                        child: InkWell(
                                                          onTap: () {
                                                            _settingModalBottomSheet(
                                                                context);
                                                          },
                                                          child: Align(
                                                            alignment: Alignment
                                                                .bottomRight,
                                                            child: CircleAvatar(
                                                              radius: 15,
                                                              backgroundColor:
                                                                  Colors.white,
                                                              child: Icon(
                                                                Icons
                                                                    .camera_alt,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                size: 26.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        margin: getMargin(
                                                            bottom: 10,
                                                            top: 20),
                                                        height:
                                                            getVerticalSize(60),
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
                                                          textInputAction: null,
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
                                                              margin: getMargin(
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
                                                                      left: 15,
                                                                      right: 20,
                                                                    ),
                                                                    child: Icon(
                                                                      Icons
                                                                          .phone,
                                                                      color: Colors
                                                                          .black,
                                                                      size: 30,
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
                                                            getVerticalSize(60),
                                                        width:
                                                            getHorizontalSize(
                                                                359),
                                                        child: TextField(
                                                          maxLines: 1,
                                                          controller: c3,
                                                          textAlign:
                                                              TextAlign.left,
                                                          textAlignVertical:
                                                              TextAlignVertical
                                                                  .center,
                                                          style: AppStyle
                                                              .txtRobotoRegular20,
                                                          textInputAction: null,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
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
                                                                      left: 15,
                                                                      right: 20,
                                                                    ),
                                                                    child: Icon(
                                                                      Icons
                                                                          .home,
                                                                      color: Colors
                                                                          .black,
                                                                      size: 30,
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
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
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
                                                                        initialDate:
                                                                            DateTime
                                                                                .now(),
                                                                        firstDate:
                                                                            DateTime(
                                                                                2000),
                                                                        lastDate:
                                                                            DateTime(
                                                                                2032))
                                                                    .then(
                                                                        (value) {
                                                                  setState(() {
                                                                    d1 = value;
                                                                    a = "${d1!.year.toString()}-${d1!.month.toString().padLeft(2, '0')}-${d1!.day.toString().padLeft(2, '0')}"
                                                                        .toString();
                                                                  });
                                                                });
                                                              }, // Handle your callback
                                                              child: Text(
                                                                "${a}",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: AppStyle
                                                                    .date,
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
                                                                  color: ColorConstant
                                                                      .indigoA400,
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .txtRoundedBorder17),
                                                          child: InkWell(
                                                              onTap: () {
                                                                checkUser();
                                                              }, // Handle your callback
                                                              child: Text(
                                                                "Update",
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
          )),
    );
  }

  onTapImgUser() {
    Get.toNamed(AppRoutes.profileScreen);
  }
}
