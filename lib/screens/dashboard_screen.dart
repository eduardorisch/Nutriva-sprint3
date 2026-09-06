import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutriva_sprint3/components/dashboard.dart';
import 'package:nutriva_sprint3/components/dashboard_header.dart';
import 'package:nutriva_sprint3/components/metricas.dart';
import 'package:nutriva_sprint3/enum/periodos.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  State<Dashboardscreen> createState() => _DashboardscreenState();
}

class _DashboardscreenState extends State<Dashboardscreen> {
  PeriodoMetricas periodoSelecionado = PeriodoMetricas.esteMes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const DashboardHeader(),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      DashboardIntro(
                        periodo: periodoSelecionado,
                        onPeriodoChanged: (novoPeriodo) {
                          setState(() {
                            periodoSelecionado = novoPeriodo;
                          });
                        },
                      ),

                      const SizedBox(height: 20),

                      Metricas(periodo: periodoSelecionado),

                      const SizedBox(height: 16),

                      Dashboard(periodo: periodoSelecionado),
                    ],
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

class DashboardIntro extends StatelessWidget {
  final PeriodoMetricas periodo;
  final ValueChanged<PeriodoMetricas> onPeriodoChanged;

  const DashboardIntro({
    super.key,
    required this.periodo,
    required this.onPeriodoChanged,
  });

  @override
  Widget build(BuildContext context) {
    final actions = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FilterButton(
          icon: Icons.calendar_today_outlined,
          label: periodo.label,
          onSelected: onPeriodoChanged,
        ),

        const SizedBox(width: 8),

        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.location_on_outlined, size: 14),
          label: const Text('Todos os Postos'),
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF172033),
            side: const BorderSide(color: Color(0xFFE9EDF2)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            minimumSize: const Size(0, 36),
          ),
        ),

        const SizedBox(width: 8),

        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.file_download_outlined, size: 14),
          label: const Text('Exportar'),
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF172033),
            side: const BorderSide(color: Color(0xFFE9EDF2)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );

    final title = SizedBox(
      width: 700,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'VISÃO GERAL',
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: .6,
              color: Color(0xFF1BB6A5),
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Impacto da campanha',
            style:  GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Color(0xFF172033),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Acompanhe a performance da Nutriva nos postos de coleta parceiros.',
            style:  GoogleFonts.inter(fontSize: 12, color: Color(0xFF7B8496)),
          ),
        ],
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [title, actions],
    );
  }
}

class FilterButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final ValueChanged<PeriodoMetricas> onSelected;

  const FilterButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<PeriodoMetricas>(
      onSelected: onSelected,

      itemBuilder: (context) {
        return PeriodoMetricas.values.map((periodo) {
          final selecionado = periodo.label == label;

          return PopupMenuItem<PeriodoMetricas>(
            value: periodo,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                  child: selecionado
                      ? const Icon(
                          Icons.check,
                          size: 14,
                          color: Color(0xFF1BB6A5),
                        )
                      : null,
                ),

                Text(
                  periodo.label,
                  style:  GoogleFonts.inter(
                    fontSize: 12,
                    color: Color(0xFF172033),
                  ),
                ),
              ],
            ),
          );
        }).toList();
      },

      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE9EDF2)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 13, color: const Color(0xFF7B8496)),

            const SizedBox(width: 8),

            Text(
              label,
              style:   GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF172033),
              ),
            ),

            const SizedBox(width: 8),

            const Icon(
              Icons.keyboard_arrow_down,
              size: 15,
              color: Color(0xFF7B8496),
            ),
          ],
        ),
      ),
    );
  }
}
