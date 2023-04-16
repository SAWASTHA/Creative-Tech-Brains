import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hiw/core/app_export.dart';
import 'package:intl/intl.dart';
import '../../theme/app_style.dart';
import '../doctorsData/doctorsDataa.dart';
import 'controller/hospitalData_controller.dart';

class hospitalData extends StatelessWidget {
  hospitalData({required this.email});
  final email;
  String name = "";
  String emaill = "";
  String address = "";
  String number = "";
  String img = "";
  String rating = "";
  String amb = "";
  String abeds = "";
  Future<bool> emailCheck(email) async {
    bool result = false;

    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('hospitals').get();
    snapshot.docs.forEach((f) {
      if (f['email'] == email) {
        name = f['name'];
        emaill = f['email'];
        address = f['Address'];
        number = f['number'];
        img = f['Img Url'];
        rating = f['Rating'];
        amb = f['ambulance'];
        abeds = f['abeds'];
      }
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final nowww = new DateTime.now();
    String formatDate(DateTime date) =>
        new DateFormat("EEEE, d MMMM").format(date);
    return Scaffold(
      body: FutureBuilder(
        future: emailCheck(email),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.black,
                  height: 1100,
                  child: Stack(children: [
                    Positioned(
                      child: Container(
                        height: 475,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          child: Image.network(
                            img,
                            fit: BoxFit.cover,
                            width: 1000.0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 450,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(45),
                                  topRight: Radius.circular(45))),
                          child: Column(
                            children: [
                              Padding(
                                padding: getPadding(left: 30, top: 30),
                                child: Column(children: [
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "${name}",
                                        style: TextStyle(
                                            color: ColorConstant.blue800,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: 'Poppins',
                                            fontSize: 30),
                                      )),
                                  Padding(
                                    padding: getPadding(top: 10),
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          formatDate(nowww),
                                          style: AppStyle.hospitaldate,
                                        )),
                                  ),
                                  Padding(
                                    padding: getPadding(top: 20),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(rating),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(top: 10),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Contact :" + number,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(top: 10, right: 30),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        address,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(top: 30, right: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Ambulance",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900,
                                              color: ColorConstant.blue800),
                                        ),
                                        Text(
                                          "Available Beds",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900,
                                              color: ColorConstant.blue800),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(top: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            width: 120,
                                            child: Text(
                                              amb,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Container(
                                            width: 120,
                                            child: Text(
                                              abeds,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(top: 35),
                                    child: Container(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        "Doctors",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w900,
                                            color: ColorConstant.blue800,
                                            fontFamily: "Poppins"),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: getPadding(),
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
                                                    height: 250.0,
                                                    child: ListView.builder(
                                                      itemCount: snapshot
                                                          .data!.docs.length,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          (context, position) {
                                                        var data = snapshot
                                                                .data!
                                                                .docs[position]
                                                                .data()
                                                            as Map<String,
                                                                dynamic>;
                                                        if (data['workplace'] ==
                                                            name) {
                                                          return Padding(
                                                            padding: getPadding(
                                                                left: 5,
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
                                                                            borderRadius:
                                                                                BorderRadius.circular(25),
                                                                            child:
                                                                                Image(
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
                                                                            left:
                                                                                15,
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                60,
                                                                            width:
                                                                                160,
                                                                            decoration:
                                                                                BoxDecoration(boxShadow: [
                                                                              BoxShadow(
                                                                                color: Colors.grey,
                                                                                blurRadius: 5.0,
                                                                              ),
                                                                            ], color: Colors.white, border: Border.all(width: 0, color: Colors.white), borderRadius: BorderRadius.circular(20)),
                                                                            child:
                                                                                Column(
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
                                                        }
                                                        return SizedBox();
                                                      },
                                                    ))
                                              ],
                                            );
                                          } else {
                                            return SizedBox();
                                          }
                                        },
                                      )),
                                ]),
                              ),
                            ],
                          ),
                        ))
                  ]),
                ),
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
        },
      ),
    );
  }
}
