import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liviz_shop/constants.dart';
import 'package:liviz_shop/screens/home/home_screen.dart';
import 'package:liviz_shop/screens/mainscreen/mainscreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CongratulationsScreen extends StatefulWidget {
  const CongratulationsScreen({super.key});

  @override
  State<CongratulationsScreen> createState() => _CongratulationsScreenState();
}

class _CongratulationsScreenState extends State<CongratulationsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool isPlaying = false;
  bool isValidated = false;
  double _percent = 0;
  final controller = ConfettiController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _sendRequest();

    //listen to states: playing, stopped
    controller.addListener(() {
      setState(() {
        isPlaying = controller.state == ConfettiControllerState.playing;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    controller.dispose();
    super.dispose();
  }

  void _sendRequest() async {
    /*    Dio dio = Dio();
    var response = await dio.post(
      'https://vbs-solutions.com/',
      onSendProgress: (int receive, int total) {
        print("${(total * -1)}");
        //print("${(receive)}");
      },
      data: {
        "field1": "value1",
        "field2": "value2",
      },
    ); */

    Timer.periodic(Duration(milliseconds: 500), (timer) async {
      if (_percent < 0.9) {
        setState(() {
          _percent = _percent + 0.1;
        });
      } else {
        timer.cancel();
        setState(() {
          isValidated = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
          body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              padding: EdgeInsets.all(defaultPadding),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    CircularPercentIndicator(
                      radius: 120.0,
                      lineWidth: 13.0,
                      animation: true,
                      animateFromLastPercent: true,
                      percent: _percent,
                      center: isValidated
                          ? Container(
                              height: 70,
                              width: 70,
                              child: CircleAvatar(
                                backgroundColor: primaryColor.withOpacity(0.15),
                                child: Icon(
                                  Icons.check,
                                  color: primaryColor,
                                  size: 45,
                                ),
                              ),
                            )
                          : new Text(
                              "${(_percent * 100).toInt()}%",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                      footer: new Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (!isValidated)
                                SpinKitThreeBounce(
                                  color: Colors.black,
                                  size: 10,
                                ),
                              Text(
                                isValidated
                                    ? "Congratulations"
                                    : "Pending Validation",
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0),
                              ),
                              if (!isValidated)
                                SpinKitThreeBounce(
                                  color: Colors.black,
                                  size: 10,
                                )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Visibility(
                              visible: isValidated,
                              child: Text(
                                "Your purchase has been validated, please wait for the delivery person to contact you for delivery.",
                                textAlign: TextAlign.center,
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Visibility(
                              visible: isValidated,
                              child: Center(
                                child: SizedBox(
                                  width: 200,
                                  height: 48,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary: primaryColor,
                                        shape: const StadiumBorder()),
                                    child: const Text("Get your receipt"),
                                  ),
                                ),
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Visibility(
                              visible: isValidated,
                              child: Center(
                                child: SizedBox(
                                  width: 200,
                                  height: 48,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType
                                                  .leftToRightJoined,
                                              duration:
                                                  Duration(milliseconds: 700),
                                              childCurrent:
                                                  CongratulationsScreen(),
                                              reverseDuration:
                                                  Duration(milliseconds: 700),
                                              child: MainScreen()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: primaryColor.withOpacity(0.2),
                                        shape: const StadiumBorder()),
                                    child: const Text(
                                      "Back to home",
                                      style: TextStyle(color: primaryColor),
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: primaryColor,
                    ),
                  ],
                ),
              )),
        ),
        ConfettiWidget(
          confettiController: controller,
          shouldLoop: false,
        )
      ],
    );
  }
}
