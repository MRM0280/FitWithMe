import 'package:fitwithme/constant/constants.dart';
import 'package:fitwithme/screens.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  logoutDialogue() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        double width = MediaQuery.of(context).size.width;
        // return object of type Dialog
        return Dialog(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "You sure want to logout?",
                      style: black16MediumTextStyle,
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: (width / 3.5),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              'Cancel',
                              style: black16RegularTextStyle,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: Walkthrough()));
                          },
                          child: Container(
                            width: (width / 3.5),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              'Logout',
                              style: white16RegularTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Profile',
          style: appBarTextStyle,
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            image: DecorationImage(
                              image: AssetImage('assets/user.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        widthSpace,
                        widthSpace,
                        Text(
                          'Stella French',
                          style: black16SemiBoldTextStyle,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: AccountSetting()));
                      },
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: primaryColor,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: whiteColor,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25.0),
                Text(
                  'About'.toUpperCase(),
                  style: black12RegularTextStyle,
                ),
                heightSpace,
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: TrainerList()));
                  },
                  child: settingTile('My Trainer', ''),
                ),
                InkWell(
                  onTap: () {},
                  child: settingTile('My Workout', ''),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: Notifications()));
                  },
                  child: settingTile('Notifications', ''),
                ),
                InkWell(
                  onTap: () {},
                  child: settingTile('Language', ''),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: UnlockPremium()));
                  },
                  child: settingTile('Unlock Premium', ''),
                ),
                InkWell(
                  onTap: () {},
                  child: settingTile('Invite Friends', ''),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: PrivacyPolicy(),
                      ),
                    );
                  },
                  child: settingTile('Privacy Policy', ''),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: TermsOfUse(),
                      ),
                    );
                  },
                  child: settingTile('Terms of use', ''),
                ),
                SizedBox(height: 25.0),
                Text(
                  'App'.toUpperCase(),
                  style: black12RegularTextStyle,
                ),
                heightSpace,
                InkWell(
                  onTap: () {},
                  child: settingTile('Support', ''),
                ),
                InkWell(
                  onTap: () {},
                  child: settingTile('Report a Bug', ''),
                ),
                InkWell(
                  onTap: () {},
                  child: settingTile('App Version 1.0', ''),
                ),
                InkWell(
                  onTap: () => logoutDialogue(),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: fixPadding * 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.red,
                          size: 24.0,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          'Logout',
                          style: red16MediumTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  settingTile(title, type) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: fixPadding * 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: black16MediumTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  (type != '')
                      ? Text(
                          type,
                          style: black16RegularTextStyle,
                        )
                      : Container(),
                  SizedBox(width: 5.0),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12.0,
                    color: blackColor,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 1.0,
          color: lightGreyColor,
        ),
      ],
    );
  }
}
