import 'package:flutter/material.dart';
import 'package:nutriva_sprint3/enum/tiposAgendamento.dart';
import 'cardObjetivo.dart';

class ObjectiveSelector extends StatelessWidget {
  final TiposAgendamento selected;
  final ValueChanged<TiposAgendamento> onChanged;

  const ObjectiveSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 650;

        final cards = TiposAgendamento.values.map((objetivo) {
          return ObjectivoCard(
            objetivo: objetivo,
            selected: selected == objetivo,
            onTap: () => onChanged(objetivo),
          );
        }).toList();

        if (isCompact) {
          return Column(
            children: [
              for (final card in cards) ...[card, SizedBox(height: 12)],
            ],
          );
        }

        return SizedBox(
          height: 140,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < cards.length; i++) ...[
                Expanded(child: SizedBox(height: 140, child: cards[i])),
                if (i != cards.length - 1) const SizedBox(width: 10),
              ],
            ],
          ),
        );
      },
    );
  }
}
