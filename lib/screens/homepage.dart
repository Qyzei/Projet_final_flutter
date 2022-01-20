// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_final_fields, unused_field, non_constant_identifier_names, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/model/user_model.dart';
import '/providers/recommended_provider.dart';
import '/theme.dart';
import '/models/city.dart';
import '/models/recommended.dart';
import '/models/tips.dart';
import '/widgets/city_card.dart';
import '/widgets/recommended_list.dart';
import '/widgets/tips_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  UserModel loggedInUser = UserModel();

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var recommendProvider = Provider.of<RecommendedProvider>(context);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Explore Now',
                style: blackText.copyWith(fontSize: 24),
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                "${loggedInUser.firstName} ${loggedInUser.secondName}",
                style: greyText.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Popular Cities',
                style: blackText.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 24),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Casblanca',
                      imgUrl: 'assets/city1.png',
                    ),
                  ),
                  SizedBox(width: 20),
                  CityCard(
                    City(
                        id: 2,
                        name: 'Rabat',
                        imgUrl: 'assets/city2.png',
                        isPopular: true),
                  ),
                  SizedBox(width: 20),
                  CityCard(
                    City(
                      id: 3,
                      name: 'tanger',
                      imgUrl: 'assets/city3.png',
                    ),
                  ),
                  SizedBox(width: 20),
                  CityCard(
                    City(
                      id: 4,
                      name: 'agadir',
                      imgUrl: 'assets/city4.png',
                    ),
                  ),
                  SizedBox(width: 20),
                  CityCard(
                    City(
                        id: 5,
                        name: 'marrakech',
                        imgUrl: 'assets/city5.png',
                        isPopular: true),
                  ),
                  SizedBox(width: 20),
                  CityCard(
                    City(
                      id: 6,
                      name: 'fes',
                      imgUrl: 'assets/city6.png',
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Recommended Spaces',
                style: blackText.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: FutureBuilder(
                  future: recommendProvider.getData(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      List<Recommended> data = snapshot.data;

                      print(data);

                      int _index = 0;

                      return Column(
                          children: data.map((item) {
                        _index++;
                        return Container(
                          margin: EdgeInsets.only(top: _index == 1 ? 0 : 30),
                          child: RecommendedList(item),
                        );
                      }).toList());
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Tips & Guidance',
                style: blackText.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  TipsList(
                    Tips(
                      id: 1,
                      imgUrl: 'assets/tips1.png',
                      tipsTitle: 'City Guidelines',
                      dateUpdate: 'Updated 20 Apr',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TipsList(
                    Tips(
                      id: 2,
                      imgUrl: 'assets/tips2.png',
                      tipsTitle: 'Casablanca Fairship',
                      dateUpdate: 'Updated 11 Dec',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 75),
          ],
        ),
      ),
      // floatingActionButton: BottomBar(
      //   selectedMenu: MenuState.home,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
