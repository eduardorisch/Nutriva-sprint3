import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BrandPanel extends StatelessWidget {
  const BrandPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF001E44), Color(0xFF00284E)],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -120,
            top: -100,
            child: IgnorePointer(
              child: Container(
                width: 420,
                height: 420,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Color(0xFF007A91).withOpacity(.50),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(left: 25, top: 30, child: Logo()),
          Positioned(left: 25, top: 250, child: _BrandCopy()),
          Positioned(
            left: 30,
            bottom: 40,
            child: Text(
              '© 2026 Nutriva • FIAP • Euformma',
              style: TextStyle(
                color: Colors.white.withOpacity(.50),
                fontSize: 7,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Color(0xFF10C7C1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.water_drop, color: Color(0xFF002044), size: 18),
            ),
            SizedBox(width: 6),
            Text(
              'Nutriva',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BrandCopy extends StatelessWidget {
  const _BrandCopy();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PAINEL ADMINISTRATIVO',
          style: GoogleFonts.inter(
            color: Color(0xFF35C8C4).withOpacity(.9),
            fontSize: 10,
            fontWeight: FontWeight.w300,
            letterSpacing: 1.05,
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Inteligência de dados\npara salvar mais vidas.',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 30,
            height: 1.08,
            fontWeight: FontWeight.w800,
            letterSpacing: -.35,
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Acompanhe doações, postos de coleta e impacto social\nem tempo real.',
          style: GoogleFonts.inter(
            color: Colors.white.withOpacity(.58),
            fontSize: 12,
            height: 1.35,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
