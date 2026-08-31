import 'package:flutter/material.dart';
import 'package:nutriva_sprint3/components/heroSection.dart';
import 'package:nutriva_sprint3/components/navbar.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF6FBFC), Color(0xFFEAF8FA), Color(0xFFA9E8E5)],
          ),
        ),
        child: Column(children: [Navbar(), HeroSection()]),
      ),
    );
  }
}
