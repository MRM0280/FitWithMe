import 'package:fitwithme/constant/constants.dart';
import 'package:fitwithme/screens.dart';
import 'package:fitwithme/widget/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class WorkoutDetail extends StatefulWidget {
  final String title, heroTag, image;

  const WorkoutDetail(
      {Key key,
      @required this.title,
      @required this.heroTag,
      @required this.image})
      : super(key: key);
  @override
  _WorkoutDetailState createState() => _WorkoutDetailState();
}

class _WorkoutDetailState extends State<WorkoutDetail> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool favorite = false;

  final exerciseList = [
    {
      'title': 'Push-ups',
      'image': 'assets/workout/workout_1.jpg',
      'time': '2 mins',
      'burn': '85 Calories',
      'status': 'completed'
    },
    {
      'title': 'Bicycle Crunch',
      'image': 'assets/workout/workout_2.jpg',
      'time': '2 mins',
      'burn': '95 Calories',
      'status': 'remain'
    },
    {
      'title': 'Mountain Climbers',
      'image': 'assets/workout/workout_3.jpg',
      'time': '3 mins',
      'burn': '75 Calories',
      'status': 'remain'
    },
    {
      'title': 'Boat Pose',
      'image': 'assets/workout/workout_4.jpg',
      'time': '2 mins',
      'burn': '40 Calories',
      'status': 'remain'
    },
    {
      'title': 'The Plank',
      'image': 'assets/workout/workout_5.jpg',
      'time': '3 mins',
      'burn': '60 Calories',
      'status': 'remain'
    },
    {
      'title': 'Medicine Ball Slam',
      'image': 'assets/workout/workout_6.jpg',
      'time': '3 mins',
      'burn': '70 Calories',
      'status': 'remain'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          widget.title,
          style: appBarTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: primaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              (favorite) ? Icons.favorite : Icons.favorite_border,
              color: primaryColor,
            ),
            onPressed: () {
              setState(() {
                favorite = !favorite;
              });
              if (favorite) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Added to favorite')));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Remove from favorite')));
              }
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  upperImage(),
                  aboutExercise(),
                  exercise(),
                  SizedBox(height: 80.0),
                ],
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80.0,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.scale,
                            alignment: Alignment.bottomCenter,
                            child: WorkoutScreen()));
                  },
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(fixPadding * 3.0,
                        fixPadding * 1.5, fixPadding * 3.0, fixPadding * 1.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [0.1, 0.5, 0.9],
                        colors: [
                          Colors.green[700],
                          Colors.green[500],
                          Colors.green[300],
                        ],
                      ),
                    ),
                    child: Text(
                      'Start Workout'.toUpperCase(),
                      style: white16MediumTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  upperImage() {
    return Container(
      margin: EdgeInsets.all(fixPadding * 2.0),
      height: 200.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 5.0,
            spreadRadius: 5.0,
            color: lightGreyColor,
          ),
        ],
      ),
      child: Stack(
        children: [
          Hero(
            tag: widget.heroTag,
            child: Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 5.0,
                    spreadRadius: 5.0,
                    color: lightGreyColor,
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 200.0,
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.5, 0.9],
                colors: [
                  blackColor.withOpacity(0.0),
                  blackColor.withOpacity(0.2),
                  blackColor.withOpacity(0.6),
                ],
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(fixPadding),
                  child: Text(
                    widget.title,
                    style: white14MediumTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  aboutExercise() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(fixPadding * 2.0),
      color: primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: (width - fixPadding * 4.0 - 2.0) / 2.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total: 6 Exercises',
                  style: white14MediumTextStyle,
                ),
                heightSpace,
                Text(
                  'Time: 15 Min',
                  style: white14MediumTextStyle,
                ),
              ],
            ),
          ),
          Container(
            width: 1.0,
            height: 60.0,
            color: whiteColor,
          ),
          Container(
            width: (width - fixPadding * 4.0 - 2.0) / 2.0,
            padding: EdgeInsets.only(left: fixPadding * 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Energy you\'ll burn',
                  style: white14MediumTextStyle,
                ),
                heightSpace,
                Text(
                  '250 Calories',
                  style: white14MediumTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  exercise() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: ColumnBuilder(
        itemCount: exerciseList.length,
        itemBuilder: (context, index) {
          final item = exerciseList[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 80.0,
                    margin: EdgeInsets.only(left: 45.0, top: 5.0, bottom: 5.0),
                    padding: EdgeInsets.only(
                      left: (45.0 + fixPadding),
                      right: fixPadding,
                    ),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: whiteColor,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          blurRadius: 3.0,
                          spreadRadius: 3.0,
                          color: lightGreyColor,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'],
                              style: black16MediumTextStyle,
                            ),
                            height5Space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Time:',
                                  style: black12MediumTextStyle,
                                ),
                                SizedBox(width: 3.0),
                                Text(
                                  item['time'],
                                  style: grey12RegularTextStyle,
                                )
                              ],
                            ),
                            SizedBox(height: 2.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Burns:',
                                  style: black12MediumTextStyle,
                                ),
                                SizedBox(width: 3.0),
                                Text(
                                  item['burn'],
                                  style: grey12RegularTextStyle,
                                )
                              ],
                            ),
                          ],
                        ),
                        (item['status'] == 'completed')
                            ? Container(
                                width: 24.0,
                                height: 24.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.green,
                                ),
                                child: Icon(
                                  Icons.check,
                                  size: 16.0,
                                  color: whiteColor,
                                ),
                              )
                            : Container(
                                height: 80.0,
                                margin: EdgeInsets.only(top: fixPadding),
                                alignment: Alignment.topRight,
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: primaryColor,
                                  ),
                                  child: Text(
                                    'Remain',
                                    style: whiteSmallTextStyle,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  Container(
                    width: 90.0,
                    height: 90.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45.0),
                      border: Border.all(
                        width: 2.0,
                        color:
                            (index % 2 == 0) ? primaryColor : Colors.red[800],
                      ),
                      image: DecorationImage(
                        image: AssetImage(item['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              (index != exerciseList.length - 1)
                  ? Container(
                      width: 1.5,
                      height: 30.0,
                      color: (item['status'] == 'completed')
                          ? primaryColor
                          : greyColor.withOpacity(0.7),
                      margin: EdgeInsets.only(left: 43.5),
                    )
                  : Container(),
            ],
          );
        },
      ),
    );
  }
}
