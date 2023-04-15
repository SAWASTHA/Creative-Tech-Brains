import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';

import 'package:hiw/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hiw/firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../widgets/app_bar/appbar2.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../doctorsData/doctorsDataa.dart';
import '../userinfo.dart';

extension Capitalized on String {
  String capitalized() =>
      this.substring(0, 1).toUpperCase() + this.substring(1).toLowerCase();
}

DatabaseReference ref = FirebaseDatabase.instance.ref();

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? name;
  String a = "";

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
    CollectionReference user = db.collection("users");
    final nowww = new DateTime.now();
    String formatDate(DateTime date) =>
        new DateFormat("EEEE, d MMMM").format(date);
    return WillPopScope(
        onWillPop: onWillPop,
        child: SafeArea(
            top: false,
            child: Scaffold(
              backgroundColor: ColorConstant.whiteA700,
              body: SingleChildScrollView(
                child: FutureBuilder(
                    future: user.doc(name).get(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        var data = snapshot.data as DocumentSnapshot;
                        return Container(
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                decoration: AppDecoration.fillBlueA700.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder24),
                                child: Padding(
                                    padding: getPadding(
                                        left: 25,
                                        top: 58,
                                        bottom: 19,
                                        right: 25),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              CircleAvatar(
                                                radius: 34,
                                                backgroundColor: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                child: CircleAvatar(
                                                    radius: 32.0,
                                                    backgroundImage:
                                                        NetworkImage(data[
                                                            'profileURL'])),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: getPadding(top: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: getPadding(left: 20),
                                                  child: Text(
                                                    "Hello,",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: getPadding(left: 20),
                                                  child: SingleChildScrollView(
                                                    child: Text(
                                                      "${data['Name']}"
                                                          .capitalized(),
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ])),
                              ),
                              Padding(
                                padding: getPadding(top: 20, left: 20),
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Looking For",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900),
                                    )),
                              ),
                              Padding(
                                padding: getPadding(top: 10),
                                child: Container(
                                  child: Column(
                                    children: [
                                      GFCarousel(
                                        height: 125,
                                        autoPlay: true,
                                        items: [
                                          InkWell(
                                            onTap: () {
                                              onTapHospital();
                                            },
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  10, 8, 0, 8),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0)),
                                                child: Image.asset(
                                                  "assets/images/ppp.png",
                                                  fit: BoxFit.cover,
                                                  width: 1000.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              onTapDoctor();
                                            },
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  10, 8, 0, 8),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0)),
                                                child: Image.asset(
                                                  "assets/images/doc.png",
                                                  fit: BoxFit.cover,
                                                  width: 1000.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: getPadding(
                                            top: 50, left: 27, right: 27),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Best Doctors",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                              InkWell(
                                                onTap: () {
                                                  onTapDoctor();
                                                },
                                                child: Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      "View All",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: ColorConstant
                                                              .blue800,
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    )),
                                              ),
                                            ]),
                                      ),
                                      Padding(
                                          padding: getPadding(top: 10),
                                          child: StreamBuilder<QuerySnapshot>(
                                            stream: FirebaseFirestore.instance
                                                .collection("doctors")
                                                .snapshots(),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        height: 290.0,
                                                        child: ListView.builder(
                                                          itemCount: snapshot
                                                              .data!
                                                              .docs
                                                              .length,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemBuilder: (context,
                                                              position) {
                                                            var data = snapshot
                                                                    .data!
                                                                    .docs[position]
                                                                    .data()
                                                                as Map<String,
                                                                    dynamic>;
                                                            return Padding(
                                                              padding:
                                                                  getPadding(
                                                                      left: 22,
                                                                      top: 22),
                                                              child: Container(
                                                                width: 190,
                                                                child: Card(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20)),
                                                                  child: Stack(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                  builder: (context) => doctorData(email: data['name']),
                                                                                ));
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                290,
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(25),
                                                                              child: Image(
                                                                                image: NetworkImage(data['image']),
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Positioned(
                                                                          bottom:
                                                                              10,
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                getPadding(
                                                                              left: 15,
                                                                            ),
                                                                            child:
                                                                                Container(
                                                                              height: 60,
                                                                              width: 160,
                                                                              decoration: BoxDecoration(boxShadow: [
                                                                                BoxShadow(
                                                                                  color: Colors.grey,
                                                                                  blurRadius: 5.0,
                                                                                ),
                                                                              ], color: Colors.white, border: Border.all(width: 0, color: Colors.white), borderRadius: BorderRadius.circular(20)),
                                                                              child: Column(
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: getPadding(top: 13, right: 40, left: 10),
                                                                                    child: Text(
                                                                                      data['name'],
                                                                                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, fontFamily: "Poppins"),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: getPadding(top: 3, right: 50, left: 10),
                                                                                    child: Text(
                                                                                      data['speciality'],
                                                                                      style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w900, fontFamily: "Poppins"),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ]),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ))
                                                  ],
                                                );
                                              } else {
                                                return SizedBox();
                                              }
                                            },
                                          )),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
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

  onTapHospital() {
    Get.toNamed(AppRoutes.hospitalsearchh);
  }

  onTapDoctor() {
    Get.toNamed(AppRoutes.doctor);
  }
}
