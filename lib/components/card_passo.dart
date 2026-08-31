import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PassoCard extends StatelessWidget {
  final String number;
  final IconData icon;
  final String title;
  final String description;

  const PassoCard({
    super.key,
    required this.number,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color(0xFFE5ECEF),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 16,
           // offset: Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIcon(),

              const Spacer(),

              Text(
                number,
                style: GoogleFonts.inter(
                  color: Color(0xFFD2F1F1),
                  fontSize: 25,
                  height: 1,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text(
            title,
            style: GoogleFonts.inter(
              color: Color(0xFF092F4E),
              fontSize: 12,
              height: 1.05,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            description,
            style: GoogleFonts.inter(
              color: Color(0xFF71808A),
              fontSize: 8.5,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: Color(0xFF0B4265),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 13,
      ),
    );
  }
}