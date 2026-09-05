import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nutriva_sprint3/enum/periodos.dart';

class Dashboard extends StatelessWidget {
  final PeriodoMetricas periodo;

  const Dashboard({
    super.key,
    required this.periodo,
  });

  @override
  Widget build(BuildContext context) {
    final dados = DashboardMock.get(periodo);

    return LayoutBuilder(
      builder: (context, constraints) {
        final stacked = constraints.maxWidth < 850;

        if (stacked) {
          return Column(
            children: [
              DonationEvolutionCard(
                doacoes: dados.doacoes,
                agendamentos: dados.agendamentos,
              ),
              const SizedBox(height: 14),
              AppointmentTypesCard(
                tipos: dados.tiposAgendamento,
              ),
            ],
          );
        }

        final leftWidth = constraints.maxWidth * .665;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: leftWidth - 7,
              child: DonationEvolutionCard(
                doacoes: dados.doacoes,
                agendamentos: dados.agendamentos,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: AppointmentTypesCard(
                tipos: dados.tiposAgendamento,
              ),
            ),
          ],
        );
      },
    );
  }
}

class AppointmentTypeData {
  final String name;
  final double value;
  final Color color;

  const AppointmentTypeData({
    required this.name,
    required this.value,
    required this.color,
  });

  String get percentage => '${value.toInt()}%';
}

class DonationEvolutionCard extends StatelessWidget {
  final List<double> doacoes;
  final List<double> agendamentos;

  const DonationEvolutionCard({
    super.key,
    required this.doacoes,
    required this.agendamentos,
  });

  @override
  Widget build(BuildContext context) {
    final maxLength = doacoes.length > agendamentos.length
        ? doacoes.length
        : agendamentos.length;

    final maxValue = [
      ...doacoes,
      ...agendamentos,
    ].fold<double>(
      0,
      (previous, value) => value > previous ? value : previous,
    );

    return DashboardCard(
      title: 'Evolução das doações',
      subtitle: 'Litros arrecadados e agendamentos por semana',
      child: SizedBox(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 12,
            right: 12,
            bottom: 2,
          ),
          child: LineChart(
            LineChartData(
              minX: 0,
              maxX: maxLength > 1 ? (maxLength - 1).toDouble() : 1,
              minY: 0,
              maxY: maxValue == 0 ? 100 : maxValue * 1.15,

              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (value) {
                  return const FlLine(
                    color: Color(0xFFE9EDF2),
                    strokeWidth: 1,
                    dashArray: [3, 4],
                  );
                },
              ),

              borderData: FlBorderData(show: false),

              titlesData: FlTitlesData(
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),

                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),

                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    getTitlesWidget: (value, meta) {
                      if (value == 0) {
                        return const SizedBox.shrink();
                      }

                      return Text(
                        value.toInt().toString(),
                        style: const TextStyle(
                          fontSize: 7,
                          color: Color(0xFF7B8496),
                        ),
                      );
                    },
                  ),
                ),

                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 22,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      final index = value.round();

                      if (index < 0 || index >= maxLength) {
                        return const SizedBox.shrink();
                      }

                      return Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Text(
                          'Sem ${index + 1}',
                          style: const TextStyle(
                            fontSize: 7,
                            color: Color(0xFF7B8496),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              lineTouchData: LineTouchData(
                enabled: true,
                touchTooltipData: LineTouchTooltipData(
                  getTooltipItems: (spots) {
                    return spots.map((spot) {
                      return LineTooltipItem(
                        '${spot.y.toInt()}',
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      );
                    }).toList();
                  },
                ),
              ),

              lineBarsData: [
                LineChartBarData(
                  spots: [
                    for (int i = 0; i < doacoes.length; i++)
                      FlSpot(
                        i.toDouble(),
                        doacoes[i],
                      ),
                  ],
                  isCurved: true,
                  curveSmoothness: .22,
                  color: const Color(0xFF1BB6A5),
                  barWidth: 2,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF1BB6A5).withOpacity(.20),
                        const Color(0xFF1BB6A5).withOpacity(.015),
                      ],
                    ),
                  ),
                ),

                LineChartBarData(
                  spots: [
                    for (int i = 0; i < agendamentos.length; i++)
                      FlSpot(
                        i.toDouble(),
                        agendamentos[i],
                      ),
                  ],
                  isCurved: true,
                  curveSmoothness: .22,
                  color: const Color(0xFF24395C),
                  barWidth: 1.8,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF24395C).withOpacity(.10),
                        const Color(0xFF24395C).withOpacity(.015),
                      ],
                    ),
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

class AppointmentTypesCard extends StatelessWidget {
  final List<AppointmentTypeData> tipos;

  const AppointmentTypesCard({
    super.key,
    required this.tipos,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      title: 'Tipos de agendamento',
      subtitle: 'Distribuição do período',
      child: SizedBox(
        height: 250,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final compact = constraints.maxWidth < 360;

            return Row(
              children: [
                Expanded(
                  flex: compact ? 3 : 4,
                  child: Center(
                    child: SizedBox(
                      width: compact ? 150 : 175,
                      height: compact ? 150 : 175,
                      child: PieChart(
                        PieChartData(
                          centerSpaceRadius: compact ? 42 : 50,
                          sectionsSpace: 3,
                          startDegreeOffset: -90,
                          sections: tipos.map((tipo) {
                            return PieChartSectionData(
                              value: tipo.value,
                              color: tipo.color,
                              radius: 18,
                              showTitle: false,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  flex: 2,
                  child: LegendList(
                    items: tipos,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class DashboardData {
  final List<double> doacoes;
  final List<double> agendamentos;
  final List<AppointmentTypeData> tiposAgendamento;

  const DashboardData({
    required this.doacoes,
    required this.agendamentos,
    required this.tiposAgendamento,
  });
}

class DashboardMock {
  static final Map<PeriodoMetricas, DashboardData> data = {
    PeriodoMetricas.esteMes: DashboardData(
      doacoes: [145, 168, 192, 228, 262, 302],
      agendamentos: [84, 103, 128, 144, 155, 176],
      tiposAgendamento: const [
        AppointmentTypeData(
          name: 'Posto',
          value: 48,
          color: Color(0xFF1BB6A5),
        ),
        AppointmentTypeData(
          name: 'Domicílio',
          value: 22,
          color: Color(0xFFE78396),
        ),
        AppointmentTypeData(
          name: 'Outro',
          value: 30,
          color: Color(0xFF24395C),
        ),
      ],
    ),

    PeriodoMetricas.estaSemana: DashboardData(
      doacoes: [42, 51, 58, 63, 72, 84],
      agendamentos: [24, 31, 35, 41, 46, 52],
      tiposAgendamento: const [
        AppointmentTypeData(
          name: 'Posto',
          value: 52,
          color: Color(0xFF1BB6A5),
        ),
        AppointmentTypeData(
          name: 'Domicílio',
          value: 18,
          color: Color(0xFFE78396),
        ),
        AppointmentTypeData(
          name: 'Outro',
          value: 30,
          color: Color(0xFF24395C),
        ),
      ],
    ),

    PeriodoMetricas.mesPassado: DashboardData(
      doacoes: [132, 151, 174, 201, 224, 260],
      agendamentos: [76, 91, 109, 121, 138, 151],
      tiposAgendamento: const [
        AppointmentTypeData(
          name: 'Posto',
          value: 45,
          color: Color(0xFF1BB6A5),
        ),
        AppointmentTypeData(
          name: 'Domicílio',
          value: 25,
          color: Color(0xFFE78396),
        ),
        AppointmentTypeData(
          name: 'Outro',
          value: 30,
          color: Color(0xFF24395C),
        ),
      ],
    ),
  };

  static DashboardData get(PeriodoMetricas periodo) {
    return data[periodo]!;
  }
}

class LegendList extends StatelessWidget {
  final List<AppointmentTypeData> items;

  const LegendList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: item.color,
                  shape: BoxShape.circle,
                ),
              ),

              const SizedBox(width: 8),

              Flexible(
                child: Text(
                  item.name,
                  style: const TextStyle(
                    color: Color(0xFF7B8496),
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(width: 7),

              Text(
                item.percentage,
                style: const TextStyle(
                  color: Color(0xFF172033),
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const DashboardCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE9EDF2),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x081C2B3A),
            blurRadius: 14,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF172033),
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            subtitle,
            style: const TextStyle(
              color: Color(0xFF7B8496),
              fontSize: 8,
              fontWeight: FontWeight.w500,
            ),
          ),

          child,
        ],
      ),
    );
  }
}