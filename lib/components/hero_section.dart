import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutriva_sprint3/navigation/AppRoutes.dart';

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1080),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: HeroText()),
              SizedBox(width: 55),
              Expanded(child: HeroImage()),
            ],
          ),
        ),
      ),
    );
  }
}

class HeroText extends StatelessWidget {
  const HeroText();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 9, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.7),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.circle, size: 6, color: Color(0xFF00B9BA),),
              SizedBox(width: 6),
              Text(
                'FIAP Challenge × Eurofarma 2026',
                style: GoogleFonts.inter(
                  fontSize: 7,
                  color: Color(0xFF59737B),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 17),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cada doação',
              style: GoogleFonts.inter(
                fontSize: 36,
                height: .98,
                fontWeight: FontWeight.w900,
                letterSpacing: -1.4,
                color: Color(0xFF06294B),
              ),
            ),
            Text(
              'conta.',
              style: GoogleFonts.inter(
                fontSize: 36,
                height: .98,
                fontWeight: FontWeight.w900,
                letterSpacing: -1.4,
                color: Color(0xFF06294B),
              ),
            ),
            Text(
              'Cada conexão',
              style: GoogleFonts.inter(
                fontSize: 36,
                height: .98,
                fontWeight: FontWeight.w900,
                letterSpacing: -1.4,
                color: Color(0xFF06294B),
              ),
            ),
            Text(
              'salva vidas.',
              style: GoogleFonts.inter(
                fontSize: 36,
                height: .98,
                fontWeight: FontWeight.w900,
                letterSpacing: -1.4,
                color: Color(0xFF06294B),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        SizedBox(
          width: 355,
          child: Text(
            'A Nutriva conecta nutrizes com produção excedente a '
            'bancos e postos de coleta de leite materno — para que '
            'nenhum prematuro fique sem alimento.',
            style: GoogleFonts.inter(
              fontSize: 11,
              height: 1.45,
              color: Color(0xFF718188),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 18),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {Navigator.pushNamed(context, AppRoutes.agenda);},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF06294B),
                foregroundColor: Colors.white,
                elevation: 5,
                shadowColor: Color(0x3306294B),
                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    'Agendar doação',
                    style: GoogleFonts.inter(
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 7),
                  Icon(Icons.arrow_forward, size: 11),
                ],
              ),
            ),
            SizedBox(width: 8),
            OutlinedButton(
              onPressed: () {Navigator.pushNamed(context, AppRoutes.mapa);},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(.7),
                foregroundColor: Color(0xFF52656C),
                side: BorderSide.none,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Encontrar postos',
                style: GoogleFonts.inter(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class HeroImage extends StatelessWidget {
  const HeroImage();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            width: 350,
            height: 270,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color(0x22004D5A),
                  blurRadius: 30,
                  offset: Offset(0, 18),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset('mae_bebe.jpg', fit: BoxFit.fill),
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: -12,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.95),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.circle, size: 8, color: Color(0xFF00B9BA),),
                  SizedBox(width: 5),
                  Text(
                    'Coleta em tempo real',
                    style: GoogleFonts.inter(
                      fontSize: 7,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF65777C),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 45,
            left: -12,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 9, vertical: 7),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.08),
                    blurRadius: 12,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: Color(0xFF05A9B3),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.favorite, color: Colors.white, size: 11),
                  ),
                  SizedBox(width: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Doadoras ativas',
                        style: GoogleFonts.inter(
                          fontSize: 6,
                          color: Color(0xFF718188),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '+ 12.430',
                        style: GoogleFonts.inter(
                          fontSize: 9,
                          color: Color(0xFF06294B),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
