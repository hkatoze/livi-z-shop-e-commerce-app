import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liviz_shop/constants.dart';
import 'package:liviz_shop/screens/signupScreen/signupScreen.dart';
import 'package:page_transition/page_transition.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  bool _isResetingPassword = false;
  bool _emailSended = false;
  int _resendEmailCount = 0;

  resendEmailCounter() {
    int count = 60;

    Timer.periodic(Duration(seconds: 1), (timer) {
      count--;
      setState(() {
        _resendEmailCount = count;
      });
      if (count == 0) {
        timer.cancel();
      }
    });
  }

  Future<void> resetPassword() async {
    await Future.delayed(Duration(milliseconds: 3000));
    setState(() {
      _isResetingPassword = false;
      _emailSended = true;
    });

    resendEmailCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: EdgeInsets.all(defaultPadding),
        child: Form(
            key: _formKey,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Image.asset(
                  "assets/images/logo.jpg",
                  scale: 3.5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "Forgot Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Enter your email address to receive password reset instructions",
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(defaultBorderRadius)),
                  ),
                  child: Row(
                    children: [
                      Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Icon(
                            Icons.email,
                            color: primaryColor.withOpacity(0.7),
                          )),
                      const SizedBox(width: defaultPadding / 2),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your email address";
                            }
                            return null;
                          },
                          onSaved: (value) => _email = value,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              hintText: "Email",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                if (_emailSended == false)
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 48,
                      child: _isResetingPassword
                          ? Stack(
                              children: [
                                Center(
                                  child: SpinKitPumpingHeart(
                                    size: 20,
                                    duration: Duration(milliseconds: 1500),
                                    color: primaryColor,
                                  ),
                                ),
                                SpinKitDualRing(
                                  duration: Duration(milliseconds: 1500),
                                  color: primaryColor,
                                )
                              ],
                            )
                          : ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  // Appeler la méthode d'authentification ici avec _email et _password
                                  setState(() {
                                    _isResetingPassword = true;
                                  });
                                  await resetPassword();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: primaryColor,
                                  shape: const StadiumBorder()),
                              child: const Text("Receive the email"),
                            ),
                    ),
                  ),
                if (_emailSended)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "Check your email, we have sent you a password reset email.",
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Container(),
                          Text("I haven't received an email. "),
                          GestureDetector(
                            child: Text(
                              "Resend ",
                              style:
                                  TextStyle(fontSize: 15, color: primaryColor),
                            ),
                          ),
                          if (_resendEmailCount != 0)
                            GestureDetector(
                              onTap: () {
                                if (_resendEmailCount == 0) {
                                  resetPassword();
                                }
                              },
                              child: Text(
                                "(${_resendEmailCount} seconds)",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            )
                        ],
                      ),
                    ],
                  )
              ],
            ))),
      ),
    );
    ;
  }
}
