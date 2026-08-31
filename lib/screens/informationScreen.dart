import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nutriva_sprint3/components/card_passo.dart';
import 'package:nutriva_sprint3/components/navbar.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 1.2,
            colors: [Colors.white, Color(0xFFF2F9FA)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Navbar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'A JORNADA DA DOAÇÃO',
                        style: GoogleFonts.inter(
                          color: Color(0xFF54C7C8),
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Quatro passos. Um\nimpacto incalculável.',
                        style: GoogleFonts.inter(
                          color: Color(0xFF092F4E),
                          fontSize: 40,
                          height: .98,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Doar leite materno é simples, seguro e gratuito. '
                        'Cuidamos da logística, dos protocolos e\n'
                        'do colher humano — você cuida de quem mais ama.',
                        style: GoogleFonts.inter(
                          color: Color(0xFF71808A),
                          fontSize: 10.5,
                          height: 1.45,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36, vertical: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: PassoCard(
                          number: '01',
                          icon: Icons.fact_check_outlined,
                          title: 'Triagem online',
                          description:
                              'Responda um questionário rápido '
                              'sobre saúde e medicamentos. '
                              'Em minutos sabemos se você pode doar.',
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: PassoCard(
                          number: '02',
                          icon: Icons.water_drop_outlined,
                          title: 'Coleta acolhedora',
                          description:
                              'Vá ao posto mais próximo ou '
                              'agende uma coleta domiciliar. '
                              'Nossa equipe orienta cada passo.',
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: PassoCard(
                          number: '03',
                          icon: Icons.local_drink_outlined,
                          title: 'Análise e pasteurização',
                          description:
                              'O leite é analisado, pasteurizado '
                              'e armazenado seguindo o protocolo '
                              'nacional dos Bancos de Leite Humano.',
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: PassoCard(
                          number: '04',
                          icon: Icons.favorite_border,
                          title: 'Vida que floresce',
                          description:
                              'Bebês prematuros recebem o alimento '
                              'mais completo do mundo — e ganham '
                              'fôlego para crescer.',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
