import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';
import '../../widgets/app_bar/appbar_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';

class forgotPass extends StatefulWidget {
  @override
  State<forgotPass> createState() => _forgotPassState();
}

class _forgotPassState extends State<forgotPass> {
  TextEditingController c1 = new TextEditingController();

  @override
  void dispose() {
    c1.dispose();
    super.dispose();
  }

  Future Passwordreset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: c1.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Password reset link sent! check your email."),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: null,
        child: SafeArea(
            top: false,
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: ColorConstant.blueA700,
                appBar: CustomAppBar(
                    height: getVerticalSize(65),
                    title: Container(
                        alignment: Alignment.centerLeft,
                        margin: getMargin(left: 36),
                        child:
                            Stack(alignment: Alignment.centerLeft, children: [
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
                              margin: getMargin(
                                  left: 9, top: 7, right: 9, bottom: 7),
                              onTap: onTapArrowleft1)
                        ])),
                    actions: [
                      AppbarImage(
                          height: getVerticalSize(42),
                          width: getHorizontalSize(76),
                          imagePath: ImageConstant.imgScreenshot2023030642x76,
                          margin: getMargin(left: 36, right: 36, bottom: 3))
                    ]),
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
                                            alignment: Alignment.topCenter,
                                            // padding: getPadding(bottom: 200),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
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
                                                              "Reset Password"
                                                                  .tr,
                                                              maxLines: null,
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: AppStyle
                                                                  .txtPoppinsSemiBold41))),
                                                  SizedBox(
                                                    height: 100,
                                                  ),
                                                  Container(
                                                    margin: getMargin(
                                                        bottom: 10, top: 10),
                                                    height: getVerticalSize(60),
                                                    width:
                                                        getHorizontalSize(359),
                                                    child: TextField(
                                                      controller: c1,
                                                      textAlign: TextAlign.left,
                                                      textAlignVertical:
                                                          TextAlignVertical
                                                              .bottom,
                                                      style: AppStyle
                                                          .txtRobotoRegular20,
                                                      textInputAction: null,
                                                      decoration:
                                                          InputDecoration(
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
                                                      width: getHorizontalSize(
                                                          359),
                                                      margin: getMargin(
                                                          bottom: 5, top: 20),
                                                      padding: getPadding(
                                                          left: 0,
                                                          top: 5,
                                                          right: 0,
                                                          bottom: 5),
                                                      decoration: AppDecoration
                                                          .txtFillBlueA700
                                                          .copyWith(
                                                              color: Color
                                                                  .fromARGB(255,
                                                                      2, 1, 1),
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .txtRoundedBorder17),
                                                      child: InkWell(
                                                          onTap: () {
                                                            Passwordreset();
                                                          }, // Handle your callback
                                                          child: Text(
                                                            "Reset Password".tr,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: AppStyle
                                                                .txtPoppinsExtraBold29,
                                                          ))),
                                                ]))),
                                  ])),
                        ])))));
  }

  onTapArrowleft1() {
    Get.back();
  }
}
