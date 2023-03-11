import 'controller/startupscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:hiw/core/app_export.dart';

class StartupscreenScreen extends GetWidget<StartupscreenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgScreenshot20230306,
                          height: getVerticalSize(288),
                          width: getHorizontalSize(314),
                          margin: getMargin(bottom: 30))
                    ]))));
  }
}
