// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class GetUserInfo extends StatelessWidget {
//   final String documentID;

//   GetUserInfo({required this.documentID});

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference user = FirebaseFirestore.instance.collection('users');
//     return FutureBuilder(
//       future: user.doc(documentID).get(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
//           return Text("Name : ${data["Name"]}");
//         }
//         return Text("Loading ...");
//       },
//     );
//   }
// }
