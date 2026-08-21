import 'package:flutter/material.dart';
import 'package:nutriva_sprint3/navigation/AppRoutes.dart';
import 'package:nutriva_sprint3/navigation/appNavigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      //AppNavigation.generateRoute('/home'); navegao braba
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(strokeWidth: 3, color: Colors.blue),
      ),
    );
  }
}
