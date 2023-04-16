import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hiw/core/app_export.dart';
import 'package:intl/intl.dart';
import 'package:text_scroll/text_scroll.dart';
import '../../theme/app_style.dart';
import '../doctorsappointment/doctorsappointmenttt.dart';

class doctorData extends StatelessWidget {
  doctorData({required this.email});
  final email;
  String name = "";
  String speciality = "";
  String rating = "";
  String language = "";
  String exp = "";
  String patients = "";
  String career = "";
  String work = "";
  String hospAdd = "";
  String img = "";
  Future<bool> emailCheck(email) async {
    bool result = false;

    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('doctors').get();
    snapshot.docs.forEach((f) {
      if (f['name'] == email) {
        name = f['name'];
        speciality = f['speciality'];
        rating = f['rating'];
        language = f['language'];
        exp = f['exp'];
        patients = f['patients'];
        career = f['career'];
        work = f['workplace'];
        hospAdd = f['hospAdd'];
        img = f['image'];
      }
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final nowww = new DateTime.now();
    String formatDate(DateTime date) =>
        new DateFormat("EEEE, d MMMM").format(date);
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: emailCheck(email),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Padding(
                          padding: getPadding(left: 22, right: 22),
                          child: Stack(
                            children: [
                              Container(
                                height: 250,
                                decoration: BoxDecoration(
                                    color: ColorConstant.docb,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                              ),
                              Positioned(
                                top: 50,
                                left: 20,
                                child: Container(
                                    width: 300,
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      "${name}",
                                      style: AppStyle.doctorname,
                                    )),
                              ),
                              Positioned(
                                bottom: 100,
                                left: 22,
                                child: Container(
                                    width: 200,
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      "${speciality}",
                                      style: AppStyle.txtPoppinsSemiBold18,
                                    )),
                              ),
                              Positioned(
                                  left: 21,
                                  bottom: 55,
                                  child: Text(
                                    "${rating}",
                                    style: TextStyle(fontSize: 25),
                                  )),
                              Positioned(
                                right: 21,
                                bottom: 40,
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      radius: 60,
                                      backgroundColor:
                                          Color.fromARGB(255, 255, 255, 255),
                                      child: CircleAvatar(
                                          radius: 59.0,
                                          backgroundImage: NetworkImage(img)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                      Padding(
                        padding: getPadding(left: 21, right: 21),
                        child: Container(
                            height: 40,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Container(
                                  margin: getMargin(
                                    left: 22,
                                  ),
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: ColorConstant.docb,
                                      shape: BoxShape.circle),
                                ),
                                Container(
                                  margin: getMargin(
                                    left: 5,
                                  ),
                                  child: Text(
                                    "Language",
                                    style: AppStyle.docts,
                                  ),
                                ),
                                Container(
                                  margin: getMargin(
                                    left: 22,
                                  ),
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: ColorConstant.docb,
                                      shape: BoxShape.circle),
                                ),
                                Container(
                                  margin: getMargin(
                                    left: 5,
                                  ),
                                  child: Text(
                                    "Experience",
                                    style: AppStyle.docts,
                                  ),
                                ),
                                Container(
                                  margin: getMargin(
                                    left: 22,
                                  ),
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: ColorConstant.docb,
                                      shape: BoxShape.circle),
                                ),
                                Container(
                                  margin: getMargin(
                                    left: 5,
                                  ),
                                  child: Text(
                                    "Patients",
                                    style: AppStyle.docts,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 15,
                          right: 21,
                        ),
                        child: Container(
                          height: 50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                                margin: getMargin(
                                  left: 10,
                                ),
                                child: Text(
                                  "${language}",
                                  style: AppStyle.doctl,
                                ),
                              ),
                              Container(
                                margin: getMargin(
                                  left: 80,
                                ),
                                child: Text(
                                  "${exp}",
                                  style: AppStyle.doctl,
                                ),
                              ),
                              Container(
                                margin: getMargin(
                                  left: 80,
                                ),
                                child: Text(
                                  "${patients}",
                                  style: AppStyle.doctl,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(left: 21, right: 21, top: 30),
                        child: Container(
                          padding: getPadding(left: 20, right: 20),
                          child: Text(
                            "${career}",
                            style: AppStyle.doctc,
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(top: 30, left: 38),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Work Place",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(right: 40, left: 40),
                        child: Container(
                          child: TextScroll(
                            "${work}",
                            style: TextStyle(
                                color: ColorConstant.docb,
                                fontSize: 26,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      Container(
                        padding:
                            getPadding(left: 32, right: 25, top: 30, bottom: 0),
                        child: Text(
                          hospAdd,
                          style: AppStyle.doctc,
                        ),
                      ),
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
            },
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Doctorsappointmenttt(
                    dname: name,
                  ),
                ));
          },
          child: Container(
              alignment: Alignment.center,
              margin: getMargin(bottom: 20, right: 20, left: 20),
              decoration: BoxDecoration(
                  color: ColorConstant.docb,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              height: 70,
              width: 320,
              child: Text(
                "Create Appointment",
                style: AppStyle.app,
              )),
        ),
      ),
    );
  }
}
