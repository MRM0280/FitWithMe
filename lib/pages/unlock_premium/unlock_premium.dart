import 'package:fitwithme/constant/constants.dart';
import 'package:fitwithme/screens.dart';
import 'package:flutter/material.dart';

class UnlockPremium extends StatefulWidget {
  @override
  _UnlockPremiumState createState() => _UnlockPremiumState();
}

class _UnlockPremiumState extends State<UnlockPremium> {
  bool free = true, medium = false, full = false;
  double freePrice = 0.0, mediumPrice = 5.0, fullPrice = 10.0;

  successOrderDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(fixPadding * 2.0),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/success_gif.gif',
                      width: 70.0,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Success!",
                      style: grey16SemiBoldTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );

    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomBar()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Unlock Premium',
          style: appBarTextStyle,
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 2.0,
        child: Container(
          width: width,
          height: 80.0,
          padding: EdgeInsets.fromLTRB(fixPadding * 2.0, fixPadding * 1.3,
              fixPadding * 2.0, fixPadding * 1.3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: (width - fixPadding * 6.0) / 2.0,
                alignment: Alignment.centerLeft,
                child: Text(
                  (free)
                      ? '\$$freePrice'
                      : (medium)
                          ? '\$$mediumPrice'
                          : '\$$fullPrice',
                  style: black18SemiBoldTextStyle,
                ),
              ),
              InkWell(
                onTap: () => successOrderDialog(),
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  width: (width - fixPadding * 6.0) / 2.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: primaryColor,
                  ),
                  child: Text(
                    'Pay',
                    style: white16MediumTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Free Start
                Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        if (!free) {
                          setState(() {
                            free = true;
                            medium = false;
                            full = false;
                          });
                        }
                      },
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(fixPadding * 3.0),
                        decoration: (free)
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: whiteColor,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    blurRadius: 5.0,
                                    spreadRadius: 5.0,
                                    color: lightGreyColor,
                                  ),
                                ],
                              )
                            : BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: whiteColor,
                              ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Free Trial',
                                      style: black22SemiBoldTextStyle,
                                    ),
                                    height5Space,
                                    Text(
                                      '14 Days'.toUpperCase(),
                                      style: grey14MediumTextStyle,
                                    )
                                  ],
                                ),
                                Text(
                                  '\$$freePrice',
                                  style: (free)
                                      ? primaryColor18SemiBoldTextStyle
                                      : black18SemiBoldTextStyle,
                                ),
                              ],
                            ),
                            (free) ? heightSpace : SizedBox(height: 0.0),
                            (free)
                                ? Text(
                                    'Access to all content: All workout, all health tips and chat with trainer.',
                                    style: black16MediumTextStyle,
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    (free)
                        ? Positioned(
                            bottom: 0.0,
                            right: 0.0,
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(0.0),
                                  bottomRight: Radius.circular(20.0),
                                ),
                              ),
                              child: Icon(
                                Icons.check,
                                color: whiteColor,
                                size: 20.0,
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
                // Free End
                heightSpace,
                heightSpace,
                // Medium Start
                Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        if (!medium) {
                          setState(() {
                            free = false;
                            medium = true;
                            full = false;
                          });
                        }
                      },
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(fixPadding * 3.0),
                        decoration: (medium)
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: whiteColor,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    blurRadius: 5.0,
                                    spreadRadius: 5.0,
                                    color: lightGreyColor,
                                  ),
                                ],
                              )
                            : BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: whiteColor,
                              ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Medium',
                                      style: black22SemiBoldTextStyle,
                                    ),
                                    height5Space,
                                    Text(
                                      'Monthly Payment'.toUpperCase(),
                                      style: grey14MediumTextStyle,
                                    )
                                  ],
                                ),
                                Text(
                                  '\$$mediumPrice',
                                  style: (medium)
                                      ? primaryColor18SemiBoldTextStyle
                                      : black18SemiBoldTextStyle,
                                ),
                              ],
                            ),
                            (medium) ? heightSpace : SizedBox(height: 0.0),
                            (medium)
                                ? Text(
                                    'Access to all content: All workout, all health tips and chat with trainer.',
                                    style: black16MediumTextStyle,
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    (medium)
                        ? Positioned(
                            bottom: 0.0,
                            right: 0.0,
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(0.0),
                                  bottomRight: Radius.circular(20.0),
                                ),
                              ),
                              child: Icon(
                                Icons.check,
                                color: whiteColor,
                                size: 20.0,
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
                // Medium End

                heightSpace,
                heightSpace,
                // Full Start
                Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        if (!full) {
                          setState(() {
                            free = false;
                            medium = false;
                            full = true;
                          });
                        }
                      },
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(fixPadding * 3.0),
                        decoration: (full)
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: whiteColor,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    blurRadius: 5.0,
                                    spreadRadius: 5.0,
                                    color: lightGreyColor,
                                  ),
                                ],
                              )
                            : BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: whiteColor,
                              ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Full',
                                      style: black22SemiBoldTextStyle,
                                    ),
                                    height5Space,
                                    Text(
                                      'Monthly Payment'.toUpperCase(),
                                      style: grey14MediumTextStyle,
                                    )
                                  ],
                                ),
                                Text(
                                  '\$$fullPrice',
                                  style: (full)
                                      ? primaryColor18SemiBoldTextStyle
                                      : black18SemiBoldTextStyle,
                                ),
                              ],
                            ),
                            (full) ? heightSpace : SizedBox(height: 0.0),
                            (full)
                                ? Text(
                                    'Access to all content: All workout, all health tips and chat with trainer.',
                                    style: black16MediumTextStyle,
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    (full)
                        ? Positioned(
                            bottom: 0.0,
                            right: 0.0,
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(0.0),
                                  bottomRight: Radius.circular(20.0),
                                ),
                              ),
                              child: Icon(
                                Icons.check,
                                color: whiteColor,
                                size: 20.0,
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
                // Full End
              ],
            ),
          ),
        ],
      ),
    );
  }
}
