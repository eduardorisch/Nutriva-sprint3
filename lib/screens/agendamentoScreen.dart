import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutriva_sprint3/components/navbar.dart';
import 'package:nutriva_sprint3/enum/tiposAgendamento.dart';
import '../components/painelAgendamento.dart';

class Agendamentoscreen extends StatefulWidget {
  const Agendamentoscreen({super.key});

  @override
  State<Agendamentoscreen> createState() => _AgendamentoscreenState();
}

class _AgendamentoscreenState extends State<Agendamentoscreen> {
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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

class HeroHeading extends StatelessWidget {
  const HeroHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'AGENDAMENTO',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: Color(0xFF42BFC0),
            fontSize: 11,
            letterSpacing: 2.1,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Três minutos. Uma vida\ntransformada.',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: Color(0xFF052D55),
            fontSize: 39,
            height: 0.98,
            fontWeight: FontWeight.w800,
            letterSpacing: -.8,
          ),
        ),
        const SizedBox(height: 13),
        Text(
          'Fluxo seguro e acolhedor para você agendar sua doação.',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: Color(0xFF6C7780),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
