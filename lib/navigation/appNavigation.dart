import 'package:flutter/material.dart';
import 'package:nutriva_sprint3/navigation/AppRoutes.dart';
import 'package:nutriva_sprint3/screens/faq_screen.dart';
import 'package:nutriva_sprint3/screens/home_screen.dart';
import 'package:nutriva_sprint3/screens/information_screen.dart';
import 'package:nutriva_sprint3/screens/login_screen.dart';
import 'package:nutriva_sprint3/screens/agendamento_screen.dart';
import 'package:nutriva_sprint3/screens/mapa_screen.dart';
import 'package:nutriva_sprint3/screens/dashboard_screen.dart';
import 'package:nutriva_sprint3/screens/splash_screen.dart';

class AppNavigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());

      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => Homescreen());

      case AppRoutes.mapa:
        return MaterialPageRoute(builder: (context) => MapaScreen());

      case AppRoutes.agenda:
        return MaterialPageRoute(builder: (context) => Agendamentoscreen());

      case AppRoutes.duvida:
        return MaterialPageRoute(builder: (context) => FaqScreen());

      case AppRoutes.jornada:
        return MaterialPageRoute(builder: (context) => InformationScreen());

      case AppRoutes.login_restrito:
        return MaterialPageRoute(builder: (context) => LoginScreen());

      case AppRoutes.dashboard:
        return MaterialPageRoute(builder: (context) => Dashboardscreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Rota não encontrada'))),
        );
    }
  }
}
