import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hiw/core/app_export.dart';
import 'package:text_scroll/text_scroll.dart';

class calander extends StatefulWidget {
  // const calander({super.key});

  @override
  State<calander> createState() => _calanderState();
}

class _calanderState extends State<calander> {
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

  var email;
  void initState() {
    super.initState();
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        email = currentUser.email;
      }
    } catch (e) {}
  }

  var db = FirebaseFirestore.instance;

  Future deletebooking(String name) async {
    var booking = db.collection("users").doc(email).collection("appointments");
    booking.doc(name).delete().then((value) => onTapImgCalendar());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop,
        child: SafeArea(
            top: false,
            child: Scaffold(
              appBar: AppBar(
                shadowColor: Colors.white,
                surfaceTintColor: Colors.white,
                elevation: 0,
                toolbarHeight: 90,
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                title: Padding(
                  padding: getPadding(top: 50, left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Bookings",
                      style: AppStyle.search,
                    ),
                  ),
                ),
              ),
              body: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(email)
                    .collection("appointments")
                    .snapshots(),
                builder: (context, snapshot) {
                  return (snapshot.hasData != true)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          padding: EdgeInsets.all(20),
                          child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              var data = snapshot.data!.docs[index].data()
                                  as Map<String, dynamic>;
                              return Container(
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorConstant.blue800),
                                  child: ListTile(
                                    title: Padding(
                                      padding: getPadding(top: 10),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: getHorizontalSize(230),
                                              child: TextScroll(
                                                "${data['doctor']}          ",
                                                mode: TextScrollMode.endless,
                                                velocity: Velocity(
                                                    pixelsPerSecond:
                                                        Offset(50, 0)),
                                                selectable: true,
                                                style: AppStyle.app,
                                              ),
                                            ),
                                            Text(data['date'],
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w800))
                                          ]),
                                    ),
                                    subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: getPadding(top: 15),
                                            child: Text(data['time'],
                                                style: TextStyle(
                                                    fontSize: 35,
                                                    color: Colors.orange,
                                                    fontWeight:
                                                        FontWeight.w800)),
                                          ),
                                          Padding(
                                            padding: getPadding(),
                                            child: InkWell(
                                              onTap: () {
                                                deletebooking(
                                                    "${data['doctor']}");
                                              },
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  height: 30,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.orange),
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        color: ColorConstant
                                                            .blue800),
                                                  )),
                                            ),
                                          )
                                        ]),
                                  ));
                            },
                          ),
                        );
                },
              ),
              bottomNavigationBar: Container(
                  height: getVerticalSize(190),
                  width: MediaQuery.of(context).size.width,
                  child: Stack(alignment: Alignment.topRight, children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            height: getVerticalSize(82),
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
                        margin: getMargin(right: 86, top: 20)),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: getPadding(left: 34, right: 202, top: 100),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
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
                                      })
                                ]))),
                    CustomImageView(
                        svgPath: ImageConstant.imgCalendar,
                        height: getVerticalSize(32),
                        width: getHorizontalSize(34),
                        alignment: Alignment.centerRight,
                        margin: getMargin(right: 126)),
                    CustomImageView(
                        svgPath: ImageConstant.imgUser,
                        height: getVerticalSize(35),
                        width: getHorizontalSize(30),
                        alignment: Alignment.centerRight,
                        margin: getMargin(top: 100, right: 46),
                        onTap: () {
                          onTapImgUser();
                        })
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

  onTapImgUser() {
    Get.toNamed(AppRoutes.profileScreen);
  }

  onTapImgCalendar() {
    Get.toNamed(AppRoutes.calanderScreen);
  }
}
