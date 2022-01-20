// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import '/models/city.dart';
import '/theme.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard(this.city);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.imgUrl,
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
                city.isPopular
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 30,
                          width: 50,
                          child: Center(
                              child: Image.asset(
                            'assets/icon_star.png',
                            width: 22,
                            height: 22,
                          )),
                          decoration: BoxDecoration(
                            color: purple,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(36),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            SizedBox(height: 11),
            Text(
              city.name,
              style: blackText.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
