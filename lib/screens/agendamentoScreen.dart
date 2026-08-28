import 'package:flutter/material.dart';
import 'package:nutriva_sprint3/components/navbar.dart';
import 'package:nutriva_sprint3/enum/tiposAgendamento.dart';
import '../components/hero_heading.dart';
import '../components/painelAgendamento.dart';

class SchedulingScreen extends StatefulWidget {
  const SchedulingScreen({super.key});

  @override
  State<SchedulingScreen> createState() => _SchedulingScreenState();
}

class _SchedulingScreenState extends State<SchedulingScreen> {
  TiposAgendamento tipo = TiposAgendamento.doacao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF4FBFC), Color(0xFFE7F8F8), Color(0xFFD4F5F5)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Navbar(),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(20, 18, 20, 50),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 860),
                      child: Column(
                        children: [
                          HeroHeading(),
                          SizedBox(height: 40),
                          SchedulingPanel(
                            selectedObjective: tipo,
                            onObjectiveChanged: (value) {
                              setState(() => tipo = value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
