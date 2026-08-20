import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1080),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 12),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color(0xFF073457),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.water_drop,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Nutriva',
                    style: GoogleFonts.inter(
                      color: Color(0xFF06294B),
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Spacer(),
                Row(
                  children: [
                    NavItem('Jornada'),
                    NavItem('Postos'),
                    NavItem('Agendar'),
                    NavItem('Dúvidas'),
                  ],
                ),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF06294B),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Doar agora',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward, size: 11),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String text;

  const NavItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 12,
          color: Color(0xFF6A7B84),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
