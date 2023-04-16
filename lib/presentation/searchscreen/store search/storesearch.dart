import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hiw/core/app_export.dart';
import 'package:hiw/presentation/hospitalData/hospitalDataa.dart';

import '../../storesdata/storedataa.dart';

class storesearch extends StatefulWidget {
  @override
  State<storesearch> createState() => _searchState();
}

class _searchState extends State<storesearch> {
  String name = "";
  List<Map<String, dynamic>> data = [
    {
      "name": "Carewell Medical",
      "number": "9146585763",
      "Address": "Sangram nagar,satara parisar,Aurangabad",
      "Status": "Active",
      "rating": "⭐⭐⭐⭐",
      "description":
          "a retail shop which provides pharmaceutical drugs, among other products."
    },
    {
      "name": "Sai Sanket Medical ",
      "rating": "4.6",
      "Address": "Sutgirni Chowk Garkheda",
      "time": "Open until 11:59 pm",
      "exp": "9 Years in Business",
      "mobile": "07947082216"
    },
    {
      "name": "Yes Pharma ",
      "rating": "4.7",
      "Address": "Baliram Patil Road Cidco N 8",
      "time": "Open 24 Hrs",
      "exp": "7 Years in Business",
      "mobile": "07947366962"
    },
    {
      "name": "Shifa Medical & Surgical",
      "rating": "4.3",
      "Address": "Central Naka Road Central Naka",
      "time": "Open until 11:59 pm",
      "exp": "7 Years in Business",
      "mobile": "07947366602"
    },
    {
      "name": "Janseva Aushadhalaya",
      "rating": "4.1",
      "Address": "T V Center Road HUDCO",
      "time": "Open until 11:00 pm",
      "exp": "23 Years in Business",
      "mobile": "07942694163"
    },
    {
      "name": "Super Speciality Pharma ",
      "rating": "4.4",
      "Address": "Station Road Aurangabad",
      "time": "Opens at 9:00 am tomorrow",
      "exp": "7 Years in Business",
      "mobile": "07947414375"
    },
    {
      "name": " Gajanan Medical & Surgicals ",
      "rating": "4.2",
      "Address": "Jawahar Colony",
      "time": "Opens at 9:30 am tomorrow",
      "exp": "22 Years in Business",
      "mobile": "07947414240"
    },
    {
      "name": " Manushree Medical  ",
      "rating": "4.5",
      "Address": "PUNDALIK NAGAR ROAD Garkheda",
      "time": "Open 24 Hrs",
      "exp": "4 Years in Business",
      "mobile": "07947413918"
    },
    {
      "name": "  Balaji Medical Stores  ",
      "rating": "4.0",
      "Address": "Hospital Road Jawahar Colony",
      "time": "Open until 11:59 pm",
      "exp": "8 Years in Business",
      "mobile": "07947413909"
    },
    {
      "name": "  Anand Medicose and General Stores  ",
      "rating": "4.3",
      "Address": "Beed Bypass Road Satara Parisar",
      "time": "Opens at 9:00 am tomorrow",
      "exp": "14 Years in Business",
      "mobile": "07947413763"
    },
    {
      "name": "  New Harsh Medical 24x7  ",
      "rating": "4.2",
      "Address": "Paithan Gate Road Aurangabad ",
      "time": "Open until 11:59 pm",
      "exp": "22 Years in Business",
      "mobile": "07947413435"
    }
  ];
  // addData() async {
  //   for (var element in data) {
  //     FirebaseFirestore.instance.collection("stores").add(element);
  //   }
  //   print("all data added");
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   addData();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: null,
        child: SafeArea(
            top: false,
            child: Scaffold(
              backgroundColor: ColorConstant.whiteA700,
              appBar: AppBar(
                backgroundColor: ColorConstant.blue800,
                toolbarHeight: 150,
                automaticallyImplyLeading: false,
                title: Column(
                  children: [
                    Text(
                      "Search Stores",
                      style: AppStyle.searchAnything,
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0)),
                          hintText: "Search Stores",
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 0, 0, 0),
                            size: 30,
                          )),
                      onChanged: (val) {
                        setState(() {
                          name = val;
                        });
                      },
                    )
                  ],
                ),
              ),
              body: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("stores").snapshots(),
                builder: (context, snapshot) {
                  return (snapshot.connectionState == ConnectionState.waiting)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          padding: EdgeInsets.all(10),
                          child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                var data = snapshot.data!.docs[index].data()
                                    as Map<String, dynamic>;
                                if (name.isEmpty) {
                                  return Container(
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: ColorConstant.withblack),
                                    child: ListTile(
                                      title: Text(
                                        data['name'],
                                        style: AppStyle.txtPoppinsExtraBold29,
                                      ),
                                      subtitle: Text(data['Address']),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                        color: Colors.white,
                                        weight: 10,
                                      ),
                                      contentPadding: EdgeInsets.all(15),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  storedataData(
                                                      name: data['name']),
                                            ));
                                      },
                                      textColor: Colors.white,
                                    ),
                                  );
                                }
                                if (data['name']
                                    .toString()
                                    .toLowerCase()
                                    .startsWith(name.toLowerCase())) {
                                  return Container(
                                    margin: EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: ColorConstant.withblack),
                                    child: ListTile(
                                      title: Text(
                                        data['name'],
                                        style: AppStyle.txtPoppinsExtraBold29,
                                      ),
                                      subtitle: Text(data['Address']),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                        color: Colors.white,
                                        weight: 10,
                                      ),
                                      contentPadding: EdgeInsets.all(15),
                                      textColor: Colors.white,
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  storedataData(
                                                      name: data['name']),
                                            ));
                                      },
                                    ),
                                  );
                                }
                                return Container();
                              }),
                        );
                },
              ),
              bottomNavigationBar: Container(
                  height: getVerticalSize(190),
                  width: MediaQuery.of(context).size.width,
                  child: Stack(alignment: Alignment.bottomCenter, children: [
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
                        alignment: Alignment.center,
                        margin: getMargin(top: 20)),
                    Align(
                        alignment: Alignment.center,
                        child: Padding(
                            padding: getPadding(left: 34, top: 100),
                            child: Row(children: [
                              CustomImageView(
                                  svgPath: ImageConstant.imgHome,
                                  height: getSize(35),
                                  width: getSize(35),
                                  onTap: () {
                                    onTapImgHome();
                                  }),
                              CustomImageView(
                                  svgPath: ImageConstant.imgLocation,
                                  height: getVerticalSize(34),
                                  width: getHorizontalSize(27),
                                  margin: getMargin(left: 52),
                                  onTap: () {
                                    onTapImgLocation();
                                  })
                            ]))),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: getPadding(top: 100, right: 46),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomImageView(
                                      svgPath: ImageConstant.imgCalendar,
                                      height: getVerticalSize(32),
                                      width: getHorizontalSize(34),
                                      margin: getMargin(top: 2),
                                      onTap: () {
                                        onTapImgCalendar();
                                      }),
                                  CustomImageView(
                                      svgPath: ImageConstant.imgUser,
                                      height: getVerticalSize(35),
                                      width: getHorizontalSize(30),
                                      margin: getMargin(left: 48),
                                      onTap: () {
                                        onTapImgUser();
                                      })
                                ]))),
                    CustomImageView(
                        svgPath: ImageConstant.imgSearch,
                        height: getVerticalSize(32),
                        width: getHorizontalSize(34),
                        alignment: Alignment.topCenter,
                        margin: getMargin(top: 77))
                  ])),
            )));
  }

  onTapImgHome() {
    Get.toNamed(AppRoutes.homeScreen);
  }

  onTapImgLocation() {
    Get.toNamed(AppRoutes.mapsScreen);
  }

  onTapImgCalendar() {
    Get.toNamed(AppRoutes.calanderScreen);
  }

  onTapImgUser() {
    Get.toNamed(AppRoutes.profileScreen);
  }
}
