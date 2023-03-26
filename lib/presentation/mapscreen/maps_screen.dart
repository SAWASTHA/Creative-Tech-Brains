import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hiw/core/app_export.dart';
import '../Mpas/map.dart';

class Mapp extends StatefulWidget {
  @override
  State<Mapp> createState() => _MappState();
}

class _MappState extends State<Mapp> {
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

  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop,
        child: SafeArea(
            top: false,
            child: Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.startTop,
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {
                  onTapImgHome();
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: 30,
                  weight: 0.2,
                ),
              ),
              backgroundColor: ColorConstant.black900,
              body: Stack(
                children: [
                  FlutterMap(
                      options: MapOptions(
                        minZoom: 5,
                        maxZoom: 18,
                        zoom: 13,
                        center: AppConstants.myLocation,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://api.mapbox.com/styles/v1/rohitwaghmare/clfo4864v003k01t68vq2sfam/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoicm9oaXR3YWdobWFyZSIsImEiOiJjbGZvMTc1Zzgwcmw0M3FwNmVvc3RiZ3MyIn0.vlpN0tuVEw4AUrg1LG8UlA',
                          additionalOptions: {
                            'mapStyleId': AppConstants.mapBoxStyleId,
                            'accessToken': AppConstants.mapBoxAccessToken,
                          },
                        )
                      ]),
                  Positioned(
                      bottom: 20,
                      left: 20,
                      child: FloatingActionButton(
                        child: Icon(Icons.location_on),
                        backgroundColor: Color.fromARGB(255, 0, 0, 0),
                        heroTag: 1,
                        onPressed: () {
                          _getCurrentPosition();
                        },
                      )),
                  Positioned(
                    top: 50,
                    right: 20,
                    child: Text(
                        "${_currentPosition?.latitude ?? ""},${_currentPosition?.longitude ?? ""}"),
                  ),
                ],
              ),
              // bottomNavigationBar: Container(
              //     height: getVerticalSize(80),
              //     width: MediaQuery.of(context).size.width,
              //     child: Stack(alignment: Alignment.topLeft, children: [
              //       Align(
              //           alignment: Alignment.topCenter,
              //           child: Container(
              //               height: getVerticalSize(82),
              //               width: double.maxFinite,
              //               decoration: BoxDecoration(
              //                   color: ColorConstant.blue800,
              //                   borderRadius: BorderRadius.circular(
              //                       getHorizontalSize(28))))),
              //       CustomImageView(
              //           svgPath: ImageConstant.imgGroup7,
              //           height: getVerticalSize(88),
              //           width: getHorizontalSize(114),
              //           alignment: Alignment.topLeft,
              //           margin: getMargin(
              //             left: 68,
              //           )),
              //       CustomImageView(
              //           svgPath: ImageConstant.imgHome,
              //           height: getSize(35),
              //           width: getSize(35),
              //           alignment: Alignment.centerLeft,
              //           margin: getMargin(
              //             left: 34,
              //           ),
              //           onTap: () {
              //             onTapImgHome();
              //           }),
              //       Align(
              //           alignment: Alignment.centerRight,
              //           child: Padding(
              //               padding: getPadding(right: 46),
              //               child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   mainAxisSize: MainAxisSize.min,
              //                   children: [
              //                     CustomImageView(
              //                         svgPath: ImageConstant.imgLocation,
              //                         height: getVerticalSize(34),
              //                         width: getHorizontalSize(27),
              //                         // alignment: Alignment.centerLeft,
              //                         margin: getMargin(right: 55)),
              //                     CustomImageView(
              //                         svgPath: ImageConstant.imgSearch,
              //                         height: getVerticalSize(32),
              //                         width: getHorizontalSize(34),
              //                         margin: getMargin(),
              //                         onTap: () {
              //                           onTapImgSearch();
              //                         }),
              //                     CustomImageView(
              //                         svgPath: ImageConstant.imgCalendar,
              //                         height: getVerticalSize(32),
              //                         width: getHorizontalSize(34),
              //                         margin: getMargin(left: 45),
              //                         onTap: () {
              //                           onTapImgCalendar();
              //                         }),
              //                     CustomImageView(
              //                         svgPath: ImageConstant.imgUser,
              //                         height: getVerticalSize(35),
              //                         width: getHorizontalSize(30),
              //                         margin: getMargin(
              //                           left: 45,
              //                         ),
              //                         onTap: () {
              //                           onTapImgUser();
              //                         })
              //                   ]))),
              //     ])),
            )));
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
