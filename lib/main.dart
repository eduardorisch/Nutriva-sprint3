import 'package:flutter/material.dart';
import 'package:nutriva_sprint3/navigation/AppRoutes.dart';
import 'package:nutriva_sprint3/navigation/appNavigation.dart';
import 'package:nutriva_sprint3/screens/faqScreen.dart';
import 'package:nutriva_sprint3/screens/homeScreen.dart';
import 'package:nutriva_sprint3/screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutrivia',
      debugShowCheckedModeBanner: false,
      //routes: {
      //  AppRoutes.splash: (context) => const SplashScreen(),
      //  AppRoutes.home: (context) => const Homescreen()
      //},
      //initialRoute: AppRoutes.splash,
      //onGenerateRoute: AppNavigation.generateRoute,
      home: FaqScreen(),
    );
  }
}
