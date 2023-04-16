import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hiw/core/app_export.dart';
import 'package:hiw/presentation/hospitalData/hospitalDataa.dart';

class hospitalsearch extends StatefulWidget {
  @override
  State<hospitalsearch> createState() => _searchState();
}

class _searchState extends State<hospitalsearch> {
  String name = "";
  List<Map<String, dynamic>> data = [
    {
      "name": "Sigma Hospital",
      "email": "contact@unitedciigma.in",
      "number": "+91 (0240) 2366666",
      "ambulance": "0240-2366666",
      "Address": "Shahnoorwadi, Dargah Road, Aurangabad",
      "Website": "https://ciigmagroup.org",
      "Rating": "⭐⭐⭐⭐⭐",
      "Img Url":
          "https://images.jdmagicbox.com/comp/aurangabad-maharashtra/h7/9999px240.x240.181221142034.v7h7/catalogue/dr-umesh-khedkar-garkheda-aurangabad-maharashtra-cardiologists-a55icdwj18.jpg?clr",
      "abeds": "59",
      "desc": "kuch likh is mai accha description",
    },
    {
      "name": "Sigma Hospital",
      "email": "contact@unitedciigma.in",
      "number": "+91 (0240) 2366666",
      "ambulance": "0240-2366666",
      "Address": "Shahnoorwadi, Dargah Road, Aurangabad",
      "Website": "https://ciigmagroup.org",
      "Rating": "⭐⭐⭐⭐⭐",
      "Img Url":
          "https://ehealth.eletsonline.com/wp-content/uploads/2009/07/best-hospital-in-south-india.jpg",
      "abeds": "59",
      "desc":
          "United CIIGMA Hospital is a Standalone private sector hospital in Aurangabad and the range of services offered at UCH make the hospital a force to reckon with the field of Super Speciality Tertiary Healthcare."
    },
    {
      "name": "Bajaj Hospital ",
      "email": " kbh@bajajhospital.com ",
      "number": "0240 663 2111",
      "ambulance": "+91 240 663 2111",
      "Address":
          " Gut No 43 Bajaj Marg, Beed Bypass Rd, Satara Deolai Parisar, Aurangabad, Maharashtra 431010",
      "Website": " http://www.bajajhospital.com/",
      "Rating": "⭐⭐⭐⭐",
      "Img Url":
          " https://www.bajajhospital.com/Images/KBH%20Cover%20Image.jpg",
      "abeds": "200",
      "desc":
          " Marathwada Medical and Research Institute (MMRI) Kamalnayan Bajaj Hospital Aurangabad, has been established to provide health care of the highest possible quality and developed as a tertiary care hospital in Aurangabad and as the only referral point for all patients from the Marathwada region. Continuing to fulfil the critical need of providing the best medical care to the people of Marathwada, the Marathwada Medical & Research Institute (MMRI) now presents all-new comprehensive healthcare facilities under one roof at the Kamalnayan Bajaj Hospital."
    },
    {
      "name": " MGM Hospital ",
      "email": "mgmmca@themgmgroup.com",
      "number": "0240-6482000",
      "ambulance": "0240-6482000",
      "Address": "Gate No. 2, MGM Campus, N-6, CIDCO., City: Aurangabad",
      "Website": "https://www.mgmmcha.org/connect.php",
      "Rating": "⭐⭐⭐⭐",
      "Img Url": "https://www.mgmmcha.org/images/infra/mgm-entrance.jpg",
      "abeds": "350",
      "desc":
          "MGM Hospital and medical centre research institute is a  'NABH accredited' medical college hospital. It is a leading health care organization serving the health care needs of Marathwada region since January 1990. The hospital is centrally located in a green campus. The hospital was started with a bed strength of 50 which has now expanded to 700 sanctioned beds. The hospital provides medical and surgical services along with super speciality services such as Cardiology, Nephrology, Plastic surgery, Neurosurgery, Urology."
    },
    {
      "name": " Dhoot Hospital ",
      "email": " contact@dhoothospital.com ",
      "number": "+91 0240- 2478400",
      "ambulance": "+91 0240- 2478400",
      "Address": "Chikalthana, Airport Road, Aurangabad - 431210",
      "Website": "https://dhoothospitals.com/",
      "Rating": "⭐⭐⭐⭐⭐",
      "Img Url":
          "https://amritahospitals.org/wp-content/uploads/2022/09/amritahospital-fbd-scaled.jpg",
      "abeds": "320",
      "desc":
          "Since 1998, SETH NANDLAL DHOOT HOSPITAL has been treating cardiac, cancer, orthopaedic and many more multiple illness patients with the latest equipments and state of the art technology like cardiac Cath-lab, ultra-modern cardiac OT, latest anaesthesia equipments, fully equipped pathology and radio diagnostic with MRI, dialysis unit, multi slice CT scan, mammography etc. The facility serves rural and urban population with special consideration towards the under privileged who cannot even support their families."
    },
    {
      "name": " Dr. Hedgewar Hospital ",
      "email": "",
      "number": "+91 (0240) 2245000",
      "ambulance": "+91 (0240) 2245000 ",
      "Address":
          " Near Gajanand Maharaj Mandir, Road, Jawahar Colony, Garkheda, Aurangabad, Maharashtra 431005",
      "Website": "https://www.hedgewar.org/",
      "Rating": "⭐⭐⭐⭐",
      "Img Url":
          "https://media.gettyimages.com/id/1312706413/photo/modern-hospital-building.jpg?s=612x612&w=0&k=20&c=oUILskmtaPiA711DP53DFhOUvE7pfdNeEK9CfyxlGio=",
      "abeds": "280",
      "desc":
          "Dr. Babasaheb Ambedkar Vaidyakiya Pratishthan is an organization run by Professionals Doctors, who have come together to give maximum of themselves to the society. Since 1989 trust has treated 60,00,000 poor patients. Dr. Hedgewar Hospital is the nucleus of this trust. It is providing Excellent Medical Services at affordable cost to the common man. The astounding response from rural & urban poor has strengthened our beliefs and efforts. With an Air of Sacrifice in the complete atmosphere, doctors have been able to provide specialized care to poor patients as well could expand its activities, qualitatively & quantitatively."
    },
    {
      "name": " Bembde Hospital ",
      "email": "",
      "number": "088050 13088",
      "ambulance": "088050 13088",
      "Address": "14, Beed Bypass Road, Near Renukamata Mandir",
      "Website": "",
      "Rating": "⭐⭐⭐⭐⭐",
      "Img Url":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQJzMSkolkaZGvcQGXHLVgyCjPQbesF_Rs0Q&usqp=CAU",
      "abeds": "120",
      "desc":
          "Bembde Hospital is a pioneer in the field of Cosmetic Surgery, Hand Surgery, Microvascular surgery & advanced Burns Care in the region."
    },
    {
      "name": " Sunshine Hospital ",
      "email": " support@SunshineHospital.org ",
      "number": "9130561212",
      "ambulance": "9130561212",
      "Address":
          " Patel Plaza, Opposite Patel Lawns, Beed Bypass Rd, Aurangabad, Maharashtra 431001",
      "Website": "http://www.sunshinehospital.org/",
      "Rating": "⭐⭐⭐",
      "Img Url":
          "https://aist-usa.com/wp-content/uploads/2017/04/memorial-hospital-west-exterior-460x262.jpg",
      "abeds": "310",
      "desc":
          "Sunshine Surgery Hospital is a cost-effective, convenient and technologically advanced surgery hospital. We provide the most advanced surgical care with surgeons that are board-certified in their specialty"
    },
    {
      "name": " Ikon Multispeciality Hospital ",
      "email": " ikonhospital@yahoo.com ",
      "number": "+91-9225020101",
      "ambulance": "+91-9225020101",
      "Address":
          " Rose Park, Majnu Hill Rd, opp. Ganesh Colony, TV Centre Rd, Cidco, Aurangabad, Maharashtra 431001",
      "Website": "https://ikonhospital.org/",
      "Rating": "⭐⭐⭐⭐",
      "Img Url":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7-UJWI3grzVgpBil9PhBHdP5gWGKN9w8IIA&usqp=CAU",
      "abeds": "300",
      "desc":
          "Ikon Hospital is a dream dreamt by two brothers -Dr Syed Faisal & Dr Syed Atif. It took birth with single room OPD in 2008 and with mercy and benevolence of God the Almighty it has been steadily and robustly blossoming in to an oak tree with 25 various specialties under one roof. Today Ikon family is comprised of some of the best minds and hands in various Medical and Surgical specialties."
    }
  ];
  // addData() async {
  //   for (var element in data) {
  //     FirebaseFirestore.instance.collection("hospitals").add(element);
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
                      "Search Hospitals",
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
                          hintText: "Search Hospitals",
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
                stream: FirebaseFirestore.instance
                    .collection("hospitals")
                    .snapshots(),
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
                                        color: ColorConstant.indigoA400),
                                    child: ListTile(
                                      title: Text(
                                        data['name'],
                                        style: AppStyle.txtPoppinsExtraBold29,
                                      ),
                                      subtitle: Text(data['email']),
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
                                                  hospitalData(
                                                      email: data['email']),
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
                                        color: ColorConstant.indigoA400),
                                    child: ListTile(
                                      title: Text(
                                        data['name'],
                                        style: AppStyle.txtPoppinsExtraBold29,
                                      ),
                                      subtitle: Text(data['email']),
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
                                                  hospitalData(
                                                      email: data['email']),
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

  onTapList() {
    Get.toNamed(AppRoutes.hospitalDataa);
  }

  void navigatePush(hospitalData hospitalData) {}
}
