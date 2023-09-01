import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:liviz_shop/constants.dart';

import 'firebase_options.dart';
import 'screens/onboarding/onboardingScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Livi'z Boutique",
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        primarySwatch: Colors.pink,
        fontFamily: "Gordita",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      home: OnboardingScreen(),
    );
  }
}
