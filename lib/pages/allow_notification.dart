import 'package:fitwithme/constant/constants.dart';
import 'package:fitwithme/screens.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AllowNotification extends StatefulWidget {
  @override
  _AllowNotificationState createState() => _AllowNotificationState();
}

class _AllowNotificationState extends State<AllowNotification> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/fitness-girl.jpg',
            height: height * 0.5,
            fit: BoxFit.cover,
          ),
          Container(
            height: height * 0.5,
            padding: EdgeInsets.all(fixPadding * 0.4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome back',
                  style: primaryColor27BoldTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.all(fixPadding * 2.0),
                  child: Text(
                    'Allow notification to keep you on track for your plan and reach your health goals faster!',
                    style: black16Medium17HeightTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                heightSpace,
                Container(
                  padding: EdgeInsets.all(fixPadding * 2.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: Walkthrough()));
                    },
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      width: width - fixPadding * 2.0,
                      padding: EdgeInsets.all(fixPadding * 2.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: primaryColor,
                      ),
                      child: Text(
                        'Allow notifications',
                        style: white16MediumTextStyle,
                      ),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: Walkthrough()));
                  },
                  child: Text(
                    'Skip for now'.toUpperCase(),
                    style: black14MediumTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
