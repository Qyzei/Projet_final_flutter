// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print, unnecessary_new

import '/models/recommended.dart';
import '/screens/errorpage.dart';
import '/screens/mapspage.dart';
import '/widgets/facilities_item.dart';
import '/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import '/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final Recommended recommended;

  DetailPage(this.recommended);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isFavorited = true;

  @override
  Widget build(BuildContext context) {
    void launchUrl(String url) async => await canLaunch(url)
        ? await launch(url)
        // : throw 'Could not launch $url';
        : Navigator.push(
            context, MaterialPageRoute(builder: (context) => ErrorPage()));

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              widget.recommended.imgUrl.toString(),
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(height: 328),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    color: white,
                  ),
                  // height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.recommended.name.toString(),
                                    style: blackText.copyWith(fontSize: 22)),
                                SizedBox(height: 2),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${widget.recommended.price}',
                                    style: purpleText.copyWith(fontSize: 16),
                                    children: [
                                      TextSpan(
                                          text: ' / month',
                                          style:
                                              greyText.copyWith(fontSize: 16)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                  child: RatingItem(
                                    index,
                                    widget.recommended.rating!.toInt(),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'Main Facilities',
                          style: blackText.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            FacilitiesItem(
                              iconFacilities: 'assets/icon_kitchen.png',
                              item: 'kitchen',
                              total:
                                  widget.recommended.numberOfKitchens!.toInt(),
                            ),
                            SizedBox(width: 24),
                            FacilitiesItem(
                              iconFacilities: 'assets/icon_bedroom.png',
                              item: 'bedroom',
                              total:
                                  widget.recommended.numberOfBedrooms!.toInt(),
                            ),
                            SizedBox(width: 24),
                            FacilitiesItem(
                              iconFacilities: 'assets/icon_cupboard.png',
                              item: 'cupboard',
                              total:
                                  widget.recommended.numberOfCupboards!.toInt(),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'Photos',
                          style: blackText.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height: 12),
                      SizedBox(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: widget.recommended.photos!.map((item) {
                            return Container(
                              margin: EdgeInsets.only(left: 24),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(item,
                                    width: 110, height: 88, fit: BoxFit.cover),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          'Location',
                          style: blackText.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Text(
                              '${widget.recommended.address}\n${widget.recommended.city}',
                              style: greyText.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff747E86)),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                print('maps button');
                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                    builder: (context) => new MapsPage(
                                      '${widget.recommended.name}',
                                      '${widget.recommended.address}\n${widget.recommended.city}',
                                    ),
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/btn_map.png',
                                width: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        width: MediaQuery.of(context).size.width - (2 * 24),
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            print('button book now');
                            // launchUrl('tel:${widget.recommended.phone}');
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Confirmation'),
                                content: const Text(
                                    "Would you like to contact the house's owner?"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      launchUrl(
                                          'tel:${widget.recommended.phone}');
                                    },
                                    child: const Text('Call'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text(
                            'Book Now',
                            style: whiteText.copyWith(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: purple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              )),
                        ),
                      ),
                      SizedBox(height: 25)
                    ],
                  ),
                ),
              ],
            ),

            //baris code button back dan wishlist dibawah listview agar button tidak tertutup
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  InkWell(
                    onTap: () => {
                      print('wishlist'),
                      setState(() {
                        _isFavorited
                            ? _isFavorited = false
                            : _isFavorited = true;
                      })
                    },
                    child: Image.asset(
                      _isFavorited
                          ? 'assets/btn_wishlist.png'
                          : 'assets/btn_wishlist_active.png',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
