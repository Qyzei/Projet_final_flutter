import '/models/recommended.dart';
import '/screens/detailpage.dart';
import '/theme.dart';
import 'package:flutter/material.dart';

class RecommendedList extends StatelessWidget {
  final Recommended recommended;

  RecommendedList(this.recommended);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(recommended),
          ),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: SizedBox(
              height: 110,
              width: 130,
              child: Stack(
                children: [
                  Image.network(
                    recommended.imgUrl.toString(),
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 30,
                      width: 70,
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon_star.png',
                            width: 22,
                            height: 22,
                          ),
                          Text(
                            '${recommended.rating}/5',
                            style: whiteText.copyWith(fontSize: 13),
                          )
                        ],
                      )),
                      decoration: BoxDecoration(
                        color: purple,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(recommended.name.toString(),
                  style: blackText.copyWith(fontSize: 18)),
              SizedBox(height: 2),
              Text.rich(
                TextSpan(
                  text: '\$${recommended.price}',
                  style: purpleText.copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                        text: ' / month',
                        style: greyText.copyWith(fontSize: 16)),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text('${recommended.city}, ${recommended.country}',
                  style: greyText)
            ],
          ),
        ],
      ),
    );
  }
}
