import '/screens/homepage.dart';

import '/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/error.png',
                width: 300,
              ),
              SizedBox(height: 70),
              Text(
                'Where are you going?',
                style: blackText.copyWith(fontSize: 24),
              ),
              SizedBox(height: 14),
              Text(
                'Seems like the page that you were\nrequested is already gone',
                textAlign: TextAlign.center,
                style: greyText.copyWith(fontSize: 16),
              ),
              SizedBox(height: 50),
              SizedBox(
                height: 50,
                width: 210,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage())),
                  child: Text(
                    'Back to Home',
                    style: whiteText.copyWith(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
