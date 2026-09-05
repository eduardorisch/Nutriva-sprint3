import 'package:flutter/material.dart';

enum PeriodoMetricas {
  esteMes,
  estaSemana,
  mesPassado,
}

extension PeriodoMetricasExtension on PeriodoMetricas {
  String get label {
    switch (this) {
      case PeriodoMetricas.esteMes:
        return 'Este mês';
      case PeriodoMetricas.estaSemana:
        return 'Esta semana';
      case PeriodoMetricas.mesPassado:
        return 'Mês passado';
    }
  }
}

class MetricData {
  final String title;
  final String value;
  final String delta;
  final String description;
  final IconData icon;
  final Color accent;
  final Color badgeBackground;
  final bool positive;

  const MetricData({
    required this.title,
    required this.value,
    required this.delta,
    required this.description,
    required this.icon,
    required this.accent,
    required this.badgeBackground,
    required this.positive,
  });
}

class MetricasMock {
  static const Map<PeriodoMetricas, List<MetricData>> data = {
    PeriodoMetricas.esteMes: [
      MetricData(
        title: 'DOAÇÕES (LITROS)',
        value: '1.284 L',
        delta: '12,4%',
        description: 'vs mês anterior',
        icon: Icons.water_drop_outlined,
        accent: Color(0xFF1BB6A5),
        badgeBackground: Color(0xFFE9F8F5),
        positive: true,
      ),
      MetricData(
        title: 'MULHERES CADASTRADAS',
        value: '3.872',
        delta: '8,1%',
        description: 'novas nutrizes',
        icon: Icons.people_outline,
        accent: Color(0xFF6573E8),
        badgeBackground: Color(0xFFF0F0FF),
        positive: true,
      ),
      MetricData(
        title: 'CRIANÇAS BENEFICIADAS',
        value: '9.640',
        delta: '15,7%',
        description: 'estimativa',
        icon: Icons.child_care_outlined,
        accent: Color(0xFFE78396),
        badgeBackground: Color(0xFFFFF0F3),
        positive: true,
      ),
      MetricData(
        title: 'TAXA DE CONVERSÃO',
        value: '68,3%',
        delta: '2,4%',
        description: 'agendadas → doaram',
        icon: Icons.trending_up,
        accent: Color(0xFFE5B53E),
        badgeBackground: Color(0xFFFFF8E7),
        positive: false,
      ),
    ],

    PeriodoMetricas.estaSemana: [
      MetricData(
        title: 'DOAÇÕES (LITROS)',
        value: '328 L',
        delta: '6,8%',
        description: 'vs semana anterior',
        icon: Icons.water_drop_outlined,
        accent: Color(0xFF1BB6A5),
        badgeBackground: Color(0xFFE9F8F5),
        positive: true,
      ),
      MetricData(
        title: 'MULHERES CADASTRADAS',
        value: '946',
        delta: '4,3%',
        description: 'novas nutrizes',
        icon: Icons.people_outline,
        accent: Color(0xFF6573E8),
        badgeBackground: Color(0xFFF0F0FF),
        positive: true,
      ),
      MetricData(
        title: 'CRIANÇAS BENEFICIADAS',
        value: '2.410',
        delta: '9,2%',
        description: 'estimativa',
        icon: Icons.child_care_outlined,
        accent: Color(0xFFE78396),
        badgeBackground: Color(0xFFFFF0F3),
        positive: true,
      ),
      MetricData(
        title: 'TAXA DE CONVERSÃO',
        value: '71,6%',
        delta: '3,1%',
        description: 'agendadas → doaram',
        icon: Icons.trending_up,
        accent: Color(0xFFE5B53E),
        badgeBackground: Color(0xFFFFF8E7),
        positive: true,
      ),
    ],

    PeriodoMetricas.mesPassado: [
      MetricData(
        title: 'DOAÇÕES (LITROS)',
        value: '1.142 L',
        delta: '5,7%',
        description: 'vs mês anterior',
        icon: Icons.water_drop_outlined,
        accent: Color(0xFF1BB6A5),
        badgeBackground: Color(0xFFE9F8F5),
        positive: true,
      ),
      MetricData(
        title: 'MULHERES CADASTRADAS',
        value: '3.582',
        delta: '3,9%',
        description: 'novas nutrizes',
        icon: Icons.people_outline,
        accent: Color(0xFF6573E8),
        badgeBackground: Color(0xFFF0F0FF),
        positive: true,
      ),
      MetricData(
        title: 'CRIANÇAS BENEFICIADAS',
        value: '8.930',
        delta: '11,4%',
        description: 'estimativa',
        icon: Icons.child_care_outlined,
        accent: Color(0xFFE78396),
        badgeBackground: Color(0xFFFFF0F3),
        positive: true,
      ),
      MetricData(
        title: 'TAXA DE CONVERSÃO',
        value: '65,9%',
        delta: '1,8%',
        description: 'agendadas → doaram',
        icon: Icons.trending_up,
        accent: Color(0xFFE5B53E),
        badgeBackground: Color(0xFFFFF8E7),
        positive: false,
      ),
    ],
  };

  static List<MetricData> get(PeriodoMetricas periodo) {
    return data[periodo] ?? [];
  }
}