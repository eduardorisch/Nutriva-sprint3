import 'package:flutter/material.dart';
import 'package:nutriva_sprint3/navigation/AppRoutes.dart';
import 'package:nutriva_sprint3/screens/homeScreen.dart';

class AppNavigation {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case AppRoutes.home:
      return MaterialPageRoute(
        builder: (context) => Homescreen()
      );
      default:
      return MaterialPageRoute(builder: (_) => const Scaffold(
        body: Center(
          child: Text('Rota não encontrada'),
        ),
      ));
    }
  }
}