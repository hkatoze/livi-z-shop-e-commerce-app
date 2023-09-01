import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liviz_shop/constants.dart';
import 'package:liviz_shop/screens/forgotScreen/forgotScreen.dart';
import 'package:liviz_shop/screens/signupScreen/signupScreen.dart';
import 'package:liviz_shop/screens/welcome/welcome_screen.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  final String? email;
  final String? password;

  const LoginScreen({super.key, this.email, this.password});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String? _email, _password;
  bool _isLogin = false;

  void initState() {
    super.initState();
    initAuthValues();
  }

  void initAuthValues() {
    if (widget.email != null && widget.password != null) {
      setState(() {
        _emailController.text = widget.email.toString();
        _passwordController.text = widget.password.toString();
      });
    }
  }

  Future<void> login() async {
    await Future.delayed(Duration(milliseconds: 3000));
    setState(() {
      _isLogin = false;
    });
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
                  "Log in",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
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
                          controller: _emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your email address";
                            }
                            return null;
                          },
                          onSaved: (value) => _email = value,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
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
                  height: MediaQuery.of(context).size.height * 0.01,
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
                            Icons.lock,
                            color: primaryColor.withOpacity(0.7),
                          )),
                      const SizedBox(width: defaultPadding / 2),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your password";
                            }
                            return null;
                          },
                          onSaved: (value) => _password = value,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              hintText: "Password",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeftJoined,
                                  duration: const Duration(milliseconds: 700),
                                  childCurrent: const LoginScreen(),
                                  reverseDuration:
                                      const Duration(milliseconds: 700),
                                  child: ForgotScreen()));
                        },
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 48,
                    child: _isLogin
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
                                  _isLogin = true;
                                });
                                await login();
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType
                                            .rightToLeftJoined,
                                        duration:
                                            const Duration(milliseconds: 700),
                                        childCurrent: const LoginScreen(),
                                        reverseDuration:
                                            const Duration(milliseconds: 700),
                                        child: WelcomePage()));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: primaryColor,
                                shape: const StadiumBorder()),
                            child: const Text("Log in"),
                          ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: 1,
                        color: Colors.grey,
                      ),
                      Text(
                        "Or",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Card(
                          elevation: 1,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                "assets/images/f.png",
                                scale: 62,
                              )),
                        ),
                        Text(""),
                        Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                "assets/images/g.png",
                                scale: 7,
                              )),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ]),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeftJoined,
                                  duration: const Duration(milliseconds: 700),
                                  childCurrent: const LoginScreen(),
                                  reverseDuration:
                                      const Duration(milliseconds: 700),
                                  child: SignUpScreen()));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ))),
      ),
    );
    ;
  }
}
