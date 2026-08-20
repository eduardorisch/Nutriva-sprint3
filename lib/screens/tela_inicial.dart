import 'package:flutter/material.dart';
import 'package:nutriva_sprint3/components/hero_section.dart';
import 'package:nutriva_sprint3/components/navbar.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF6FBFC), Color(0xFFEAF8FA), Color(0xFFA9E8E5)],
          ),
        ),
        child: SafeArea(child: Column(children: [Navbar(), HeroSection()])),
      ),
    );
  }
}
