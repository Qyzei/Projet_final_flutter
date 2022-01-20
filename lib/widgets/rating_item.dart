import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int _index;
  final int _rating;

  RatingItem(this._index, this._rating);

  @override
  Widget build(BuildContext context) {
    print('hello index: ${_index}');
    print('hello rating: ${_rating}');
    return Image.asset(
        _index <= _rating
            ? 'assets/icon_star.png'
            : 'assets/icon_star_grey.png',
        width: 20);
  }
}
