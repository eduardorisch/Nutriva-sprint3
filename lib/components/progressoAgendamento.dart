import 'package:flutter/material.dart';
import 'package:nutriva_sprint3/enum/passosAgendamento.dart';

class ScheduleStepper extends StatelessWidget {
  final PassosAgendamento currentStep;

  const ScheduleStepper({
    super.key,
    this.currentStep = PassosAgendamento.objetivo,
  });

  @override
  Widget build(BuildContext context) {
    final steps = PassosAgendamento.values;

    return Row(
      children: [
        for (int i = 0; i < steps.length; i++) ...[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 5,
                  decoration: BoxDecoration(
                    color: i <= currentStep.index
                        ?  Color(0xFF0A385F)
                        :  Color(0xFFD9E1E4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                 SizedBox(height: 8),
                Text(
                  steps[i].label,
                  style: TextStyle(
                    color: i <= currentStep.index
                        ? Color(0xFF263D4E)
                        : Color(0xFF7B858C),
                    fontSize: 10,
                    fontWeight: i == currentStep.index
                        ? FontWeight.w700
                        : FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          if (i != steps.length - 1) SizedBox(width: 10),
        ],
      ],
    );
  }
}
