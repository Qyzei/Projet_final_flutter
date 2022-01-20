// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_string_interpolations, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import '/theme.dart';

class FacilitiesItem extends StatelessWidget {
  final String item;
  final String iconFacilities;
  final int total;

  FacilitiesItem(
      {required this.item, required this.iconFacilities, required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          iconFacilities,
          width: 32,
          height: 32,
        ),
        SizedBox(height: 8),
        Text.rich(
          TextSpan(
            text: '${total} ',
            style: purpleText,
            children: [
              TextSpan(text: '${item}', style: greyText),
            ],
          ),
        ),
      ],
    );
  }
}
