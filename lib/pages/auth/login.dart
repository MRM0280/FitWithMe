import 'package:fitwithme/constant/constants.dart';
import 'package:fitwithme/screens.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String phoneNumber = '';
  String phoneIsoCode;
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: primaryColor,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.all(fixPadding * 2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter your mobile number',
                            style: black22SemiBoldTextStyle,
                          ),
                          heightSpace,
                          heightSpace,
                          Text(
                            'Login your account with your mobile number',
                            style: black14MediumTextStyle,
                          ),
                          SizedBox(height: 50.0),
                          Text(
                            'Mobile Number',
                            style: black14MediumTextStyle,
                          ),
                          heightSpace,
                          InternationalPhoneNumberInput(
                            textStyle: TextStyle(
                              color: blackColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                            onInputChanged: (_){},
                            selectorTextStyle: TextStyle(
                              color: blackColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                            initialValue: number,
                            textFieldController: controller,
                            // inputBorder: InputBorder.none,
                            inputDecoration: InputDecoration(
                              hintText: 'Mobile Number',
                              hintStyle: TextStyle(
                                color: blackColor.withOpacity(0.5),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                              // border: InputBorder.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(fixPadding * 2.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: OTPScreen()));
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
                      'Continue',
                      style: white16MediumTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
