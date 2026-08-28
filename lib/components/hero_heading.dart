import 'package:flutter/material.dart';

class HeroHeading extends StatelessWidget {
  const HeroHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'AGENDAMENTO',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF42BFC0),
            fontSize: 11,
            letterSpacing: 2.1,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 14),
        Text(
          'Três minutos. Uma vida\ntransformada.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF052D55),
            fontSize: 39,
            height: 0.98,
            fontWeight: FontWeight.w800,
            letterSpacing: -.8,
          ),
        ),
        SizedBox(height: 13),
        Text(
          'Fluxo seguro e acolhedor para você agendar sua doação.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF6C7780),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
