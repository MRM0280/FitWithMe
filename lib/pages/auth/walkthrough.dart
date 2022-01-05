import 'dart:io';

import 'package:fitwithme/constant/constants.dart';
import 'package:fitwithme/screens.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

class Walkthrough extends StatefulWidget {
  @override
  _WalkthroughState createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  DateTime currentBackPressTime;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFBBE9E9),
      body: WillPopScope(
        child: SafeArea(
          child: Container(
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: height * 0.4,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Fit with Me',
                        style: darkBlue26BoldTextStyle,
                      ),
                      heightSpace,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding * 4.0),
                        child: Text(
                          'Sign up to get your personalized course and meal plan.',
                          style: primaryColor16Height15MediumTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding * 2.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: Register()));
                          },
                          borderRadius: BorderRadius.circular(30.0),
                          child: Container(
                            padding: EdgeInsets.all(fixPadding * 2.0),
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: primaryColor,
                            ),
                            child: Text(
                              'Continue with phone number',
                              style: white18SemiBoldTextStyle,
                            ),
                          ),
                        ),
                      ),
                      heightSpace,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding * 2.0),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30.0),
                          child: Container(
                            padding: EdgeInsets.all(fixPadding * 2.0),
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: darkBlueColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/google-icon.png',
                                  height: 25.0,
                                  fit: BoxFit.fitHeight,
                                ),
                                widthSpace,
                                widthSpace,
                                widthSpace,
                                Text(
                                  'Continue with Google',
                                  style: white18SemiBoldTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      heightSpace,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding * 2.0),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30.0),
                          child: Container(
                            padding: EdgeInsets.all(fixPadding * 2.0),
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: const Color(0xFF0080EC),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/facebook-icon.png',
                                  height: 25.0,
                                  fit: BoxFit.fitHeight,
                                ),
                                widthSpace,
                                widthSpace,
                                widthSpace,
                                Text(
                                  'Continue with Facebook',
                                  style: white18SemiBoldTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(fixPadding * 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: black16MediumTextStyle,
                      ),
                      heightSpace,
                      heightSpace,
                      heightSpace,
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: Login()));
                        },
                        child: Text(
                          'Login'.toUpperCase(),
                          style: primaryColor18SemiBoldTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }
}
