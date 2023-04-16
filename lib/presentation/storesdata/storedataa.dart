import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hiw/core/app_export.dart';
import 'package:intl/intl.dart';
import '../../theme/app_style.dart';

class storedataData extends StatelessWidget {
  storedataData({required this.name});
  final name;
  String namee = "";
  String address = "";
  String number = "";
  String description = "";
  String rating = "";
  String status = "";
  Future<bool> emailCheck(email) async {
    bool result = false;

    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('stores').get();
    snapshot.docs.forEach((f) {
      if (f['name'] == name) {
        namee = f['name'];
        address = f['address'];
        // number = f['number'];
        // description = f['description'];
        // rating = f['rating'];
        // status = f['Status'];
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
        future: emailCheck(name),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: getPadding(left: 25, top: 20),
                    child: Column(children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Store Profile",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )),
                      Row(children: [
                        Padding(
                          padding: getPadding(top: 10),
                          child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${name}",
                                style: TextStyle(
                                    fontSize: 32,
                                    color: Color.fromARGB(255, 29, 46, 53),
                                    fontWeight: FontWeight.w900),
                              )),
                        ),
                      ]),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            formatDate(nowww),
                            style: AppStyle.hospitaldate,
                          )),
                      Padding(
                        padding: getPadding(top: 10),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              address,
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: getPadding(left: 25, top: 10),
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          description,
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        )),
                  ),
                  Padding(
                    padding: getPadding(top: 40, left: 20, right: 20),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.badge,
                            color: Color.fromARGB(255, 78, 170, 210),
                            size: 30,
                          ),
                          Icon(
                            Icons.trending_up,
                            color: Color.fromARGB(255, 78, 170, 210),
                            size: 35,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 2, left: 20, right: 20),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: getPadding(right: 20),
                            child: Text(
                              "Business Status",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: getPadding(right: 30),
                            child: Text("Rating",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 15, left: 20, right: 20),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: getPadding(left: 30),
                            child: Text(
                              status,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 112, 102, 102),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: getPadding(left: 30),
                            child: Text(rating,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ),
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
        },
      ),
    );
  }
}
