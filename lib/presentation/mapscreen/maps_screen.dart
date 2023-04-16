import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hiw/core/app_export.dart';
import 'package:latlong2/latlong.dart';
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

  final pageController = PageController();
  var b = Colors.white;
  var d = Colors.red;
  int selectedIndex = 0;
  var currentLocation = AppConstants.myLocation;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: null,
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
                  weight: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
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
                              'https://api.mapbox.com/styles/v1/rohitwaghmare/clggkd0ou003e01pc045w98os/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoicm9oaXR3YWdobWFyZSIsImEiOiJjbGZvMTc1Zzgwcmw0M3FwNmVvc3RiZ3MyIn0.vlpN0tuVEw4AUrg1LG8UlA',
                          additionalOptions: {
                            'mapStyleId': AppConstants.mapBoxStyleId,
                            'accessToken': AppConstants.mapBoxAccessToken,
                          },
                        ),
                        MarkerLayer(
                          markers: [
                            for (int i = 0; i < mapMarkers.length; i++)
                              Marker(
                                rotate: true,
                                height: 40,
                                width: 40,
                                point: mapMarkers[i].location ??
                                    AppConstants.myLocation,
                                builder: (_) {
                                  return GestureDetector(
                                      onTap: () {
                                        pageController.animateToPage(
                                          i,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeInOut,
                                        );
                                        selectedIndex = i;
                                        setState(() {});
                                      },
                                      child: AnimatedScale(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        scale: selectedIndex == i ? 1 : 0.7,
                                        child: Icon(
                                          Icons.location_on,
                                          color: selectedIndex == i
                                              ? Colors.red
                                              : Colors.blue,
                                          size: 50,
                                        ),
                                      ));
                                },
                              ),
                          ],
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              height: 25,
                              width: 25,
                              point: LatLng(
                                  _currentPosition?.latitude == null
                                      ? 90.0000
                                      : _currentPosition!.latitude,
                                  _currentPosition?.longitude == null
                                      ? 135.0000
                                      : _currentPosition!.longitude),
                              builder: (context) {
                                return Material(
                                  type: MaterialType.transparency,
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2,
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                      borderRadius: BorderRadius.circular(100),
                                      color: Color.fromARGB(255, 0, 140, 255),
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        )
                      ]),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 2,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: PageView.builder(
                      controller: pageController,
                      onPageChanged: (value) {
                        selectedIndex = value;
                        currentLocation = mapMarkers[value].location ??
                            AppConstants.myLocation;
                        setState(() {});
                      },
                      itemCount: mapMarkers.length,
                      itemBuilder: (_, index) {
                        final item = mapMarkers[index];
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Card(
                            surfaceTintColor: Colors.black,
                            shadowColor: Colors.black,
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Color.fromARGB(255, 255, 255, 255),
                            child: Row(
                              children: [
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: item.rating,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return const Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                            );
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.title ?? '',
                                              style: const TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0)),
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              item.address ?? '',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    255, 94, 94, 94),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                      bottom: 250,
                      right: 20,
                      child: FloatingActionButton(
                        child: Icon(
                          Icons.location_on,
                          color: _currentPosition?.latitude == null ? b : d,
                          size: 35,
                          grade: 20,
                        ),
                        backgroundColor: Color.fromARGB(255, 0, 0, 0),
                        heroTag: 1,
                        onPressed: () {
                          _getCurrentPosition();
                        },
                      )),
                ],
              ),
            )));
  }

  onTapImgHome() {
    Get.toNamed(AppRoutes.homeScreen);
  }
}
