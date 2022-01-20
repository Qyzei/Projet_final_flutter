import 'package:cloud_firestore/cloud_firestore.dart';

import '/models/recommended.dart';
import 'package:flutter/material.dart';

class RecommendedProvider extends ChangeNotifier {
  // var data;
  List<Recommended> recommended = [];

  getData() async {
    List<Recommended> recommended = [];

    var data = await FirebaseFirestore.instance
        .collection("recommended")
        // .doc('tUHkj4Q2vWqsGKzWzcyd')
        .get()
        .then((QuerySnapshot querySnapshot) {
      return querySnapshot.docs;
    });

    recommended = data.map((e) => Recommended.fromDocument(e)).toList();

    return recommended;
  }
}
