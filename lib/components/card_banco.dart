import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutriva_sprint3/model/banco_leite.dart';

class BancoCard extends StatelessWidget {
  final BancoLeite banco;
  final bool selecionado;
  final VoidCallback? onTap;

  const BancoCard({
    super.key,
    required this.banco,
    this.selecionado = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final distancia = banco.distanciaKm ?? 0;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selecionado ? Color(0xFF062B55) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selecionado ? Color(0xFF062B55) : Color(0xFFE5E9ED),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  banco.tipo,
                  style: GoogleFonts.inter(
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.7,
                    color: selecionado ? Colors.white70 : Color(0xFF159A9C),
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                  decoration: BoxDecoration(
                    color: selecionado ? Color(0xFF159A9C) : Color(0xFFF0F5F6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${distancia.toStringAsFixed(1)} km',
                    style: GoogleFonts.inter(
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: selecionado ? Colors.white : Color(0xFF159A9C),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Text(
              banco.nome,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: selecionado ? Colors.white : Color(0xFF062B55),
              ),
            ),
            SizedBox(height: 4),
            Text(
              banco.endereco,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                fontSize: 10,
                color: selecionado ? Colors.white70 : Color(0xFF65727D),
              ),
            ),
            SizedBox(height: 3),
            Text(
              banco.horario,
              style: GoogleFonts.inter(
                fontSize: 9,
                color: selecionado ? Colors.white70 : Color(0xFF65727D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
