import 'dart:async';

import 'package:fitwithme/constant/constants.dart';
import 'package:fitwithme/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 4),
        () => Navigator.push(
            context,
            PageTransition(
                duration: Duration(milliseconds: 600),
                type: PageTransitionType.fade,
                child: AllowNotification())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Welcome',
                  style: white50SemiBoldTextStyle,
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.all(fixPadding * 4.0),
              child: SpinKitRing(
                color: whiteColor,
                size: 40.0,
                lineWidth: 2.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
