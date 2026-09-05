import 'package:flutter/material.dart';
import 'package:nutriva_sprint3/enum/periodos.dart';

class Metricas extends StatelessWidget {
  final PeriodoMetricas periodo;

  const Metricas({
    super.key,
    this.periodo = PeriodoMetricas.esteMes,
  });

  @override
  Widget build(BuildContext context) {
    final metrics = MetricasMock.get(periodo);

    return Row(
      children: [
        for (int i = 0; i < metrics.length; i++) ...[
          Expanded(
            child: MetricasCard(
              data: metrics[i],
            ),
          ),
          if (i < metrics.length - 1)
            const SizedBox(width: 12),
        ],
      ],
    );
  }
}

class MetricasCard extends StatelessWidget {
  final MetricData data;

  const MetricasCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE9EDF2),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A1C2B3A),
            blurRadius: 14,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title,
                style: const TextStyle(
                  fontSize: 7.5,
                  letterSpacing: .5,
                  color: Color(0xFF7B8496),
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              Text(
                data.value,
                style: const TextStyle(
                  fontSize: 17,
                  color: Color(0xFF172033),
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    data.positive
                        ? Icons.arrow_upward_rounded
                        : Icons.arrow_downward_rounded,
                    size: 8,
                    color: data.positive
                        ? const Color(0xFF1BB6A5)
                        : const Color(0xFFE78396),
                  ),
                  Text(
                    data.delta,
                    style: TextStyle(
                      color: data.positive
                          ? const Color(0xFF1BB6A5)
                          : const Color(0xFFE78396),
                      fontSize: 8,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      data.description,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF7B8496),
                        fontSize: 7.5,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: data.badgeBackground,
                shape: BoxShape.circle,
              ),
              child: Icon(
                data.icon,
                size: 12,
                color: data.accent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MetricData {
  final String title;
  final String value;
  final String delta;
  final String description;
  final bool positive;
  final IconData icon;
  final Color accent;
  final Color badgeBackground;

  const MetricData({
    required this.title,
    required this.value,
    required this.delta,
    required this.description,
    required this.positive,
    required this.icon,
    required this.accent,
    required this.badgeBackground,
  });
}

class MetricasMock {
  static final Map<PeriodoMetricas, List<MetricData>> data = {
    PeriodoMetricas.esteMes: const [
      MetricData(
        title: 'DOAÇÕES (LITROS)',
        value: '1.284 L',
        delta: '12,4%',
        description: 'vs mês anterior',
        positive: true,
        icon: Icons.trending_up_rounded,
        accent: Color(0xFF1BB6A5),
        badgeBackground: Color(0xFFE1F5F2),
      ),
      MetricData(
        title: 'MULHERES CADASTRADAS',
        value: '3.872',
        delta: '8,1%',
        description: 'novas nutrizes',
        positive: true,
        icon: Icons.trending_up_rounded,
        accent: Color(0xFF6C7BE0),
        badgeBackground: Color(0xFFE9EAFB),
      ),
      MetricData(
        title: 'CRIANÇAS BENEFICIADAS',
        value: '9.640',
        delta: '15,7%',
        description: 'estimativa',
        positive: true,
        icon: Icons.trending_up_rounded,
        accent: Color(0xFFE7789A),
        badgeBackground: Color(0xFFFBE7EC),
      ),
      MetricData(
        title: 'TAXA DE CONVERSÃO',
        value: '68,3%',
        delta: '2,4%',
        description: 'agendadas → doaram',
        positive: false,
        icon: Icons.trending_up_rounded,
        accent: Color(0xFFE8A23D),
        badgeBackground: Color(0xFFFCEFDC),
      ),
    ],

    PeriodoMetricas.estaSemana: const [
      MetricData(
        title: 'DOAÇÕES (LITROS)',
        value: '312 L',
        delta: '9,2%',
        description: 'vs semana anterior',
        positive: true,
        icon: Icons.trending_up_rounded,
        accent: Color(0xFF1BB6A5),
        badgeBackground: Color(0xFFE1F5F2),
      ),
      MetricData(
        title: 'MULHERES CADASTRADAS',
        value: '742',
        delta: '5,4%',
        description: 'novas nutrizes',
        positive: true,
        icon: Icons.trending_up_rounded,
        accent: Color(0xFF6C7BE0),
        badgeBackground: Color(0xFFE9EAFB),
      ),
      MetricData(
        title: 'CRIANÇAS BENEFICIADAS',
        value: '1.980',
        delta: '11,3%',
        description: 'estimativa',
        positive: true,
        icon: Icons.trending_up_rounded,
        accent: Color(0xFFE7789A),
        badgeBackground: Color(0xFFFBE7EC),
      ),
      MetricData(
        title: 'TAXA DE CONVERSÃO',
        value: '71,0%',
        delta: '1,1%',
        description: 'agendadas → doaram',
        positive: true,
        icon: Icons.trending_up_rounded,
        accent: Color(0xFFE8A23D),
        badgeBackground: Color(0xFFFCEFDC),
      ),
    ],

    PeriodoMetricas.mesPassado: const [
      MetricData(
        title: 'DOAÇÕES (LITROS)',
        value: '1.142 L',
        delta: '4,8%',
        description: 'vs mês anterior',
        positive: true,
        icon: Icons.trending_up_rounded,
        accent: Color(0xFF1BB6A5),
        badgeBackground: Color(0xFFE1F5F2),
      ),
      MetricData(
        title: 'MULHERES CADASTRADAS',
        value: '3.581',
        delta: '6,0%',
        description: 'novas nutrizes',
        positive: true,
        icon: Icons.trending_up_rounded,
        accent: Color(0xFF6C7BE0),
        badgeBackground: Color(0xFFE9EAFB),
      ),
      MetricData(
        title: 'CRIANÇAS BENEFICIADAS',
        value: '8.320',
        delta: '9,4%',
        description: 'estimativa',
        positive: true,
        icon: Icons.trending_up_rounded,
        accent: Color(0xFFE7789A),
        badgeBackground: Color(0xFFFBE7EC),
      ),
      MetricData(
        title: 'TAXA DE CONVERSÃO',
        value: '66,7%',
        delta: '3,2%',
        description: 'agendadas → doaram',
        positive: false,
        icon: Icons.trending_up_rounded,
        accent: Color(0xFFE8A23D),
        badgeBackground: Color(0xFFFCEFDC),
      ),
    ],
  };

  static List<MetricData> get(PeriodoMetricas periodo) {
    return data[periodo]!;
  }
}