import '/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '/theme.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/splash_image.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/logo.png'))),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Find Cozy House\nto Stay and Happy',
                    style: blackText.copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Stop membuang banyak waktu\npada tempat yang tidak habitable',
                    style: greyText.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 50,
                    width: 210,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Explore Now',
                        style: whiteText.copyWith(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: purple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17))),
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
