import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liviz_shop/constants.dart';
import 'package:liviz_shop/screens/loginScreen/loginScreen.dart';
import 'package:page_transition/page_transition.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _email, _password, _name;
  bool _acceptPolicy = false;
  bool _isRegister = false;

  Future<void> register() async {
    await Future.delayed(Duration(milliseconds: 3000));
    setState(() {
      _isRegister = false;
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
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Image.asset(
                  "assets/images/logo.jpg",
                  scale: 3.5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  "Sign up",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
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
                            Icons.person,
                            color: primaryColor.withOpacity(0.7),
                          )),
                      const SizedBox(width: defaultPadding / 2),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your name";
                            }
                            return null;
                          },
                          onSaved: (value) => _name = value,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              hintText: "Name",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      )
                    ],
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your password";
                            }
                            return null;
                          },
                          onSaved: (value) => _password = value,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          obscureText: true,
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
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _acceptPolicy = !_acceptPolicy;
                          });
                        },
                        child: Checkbox(
                            value: _acceptPolicy, onChanged: (value) {}),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _acceptPolicy = !_acceptPolicy;
                          });
                        },
                        child: Text(
                          "I accept all the ",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _acceptPolicy = !_acceptPolicy;
                          });
                        },
                        child: Text(
                          "Terms & Conditions",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 48,
                    child: _isRegister
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
                            onPressed: _acceptPolicy
                                ? () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      // Appeler la méthode d'authentification ici avec _email et _password
                                      setState(() {
                                        _isRegister = true;
                                      });
                                      await register();
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType
                                                  .leftToRightJoined,
                                              duration: const Duration(
                                                  milliseconds: 700),
                                              childCurrent:
                                                  const SignUpScreen(),
                                              reverseDuration: const Duration(
                                                  milliseconds: 700),
                                              child: LoginScreen(
                                                email: _email,
                                                password: _password,
                                              )));
                                    }
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                                primary: primaryColor,
                                shape: const StadiumBorder()),
                            child: const Text("Sign up"),
                          ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
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
                        "Already have an account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Log in",
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
