import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutriva_sprint3/navigation/AppRoutes.dart';
import 'package:nutriva_sprint3/navigation/appNavigation.dart';
import 'package:nutriva_sprint3/screens/faqScreen.dart';
import 'package:nutriva_sprint3/screens/homeScreen.dart';
import 'package:nutriva_sprint3/screens/agendamentoScreen.dart';
import 'package:nutriva_sprint3/screens/informationScreen.dart';
import 'package:nutriva_sprint3/screens/login_screen.dart';
import 'package:nutriva_sprint3/screens/mapa_screen.dart';
import 'package:nutriva_sprint3/screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutriva',
      debugShowCheckedModeBanner: false,
      //routes: {
      //  AppRoutes.splash: (context) => const SplashScreen(),
      //  AppRoutes.home: (context) => const Homescreen()
      //},
      //initialRoute: AppRoutes.splash,
      //onGenerateRoute: AppNavigation.generateRoute,
      home: MapaScreen(),
    );
  }
}
