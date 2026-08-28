import 'package:flutter/material.dart';
import 'package:nutriva_sprint3/enum/tiposAgendamento.dart';
import 'progressoAgendamento.dart';
import 'seletorAgendamento.dart';

class SchedulingPanel extends StatelessWidget {
  final TiposAgendamento selectedObjective;
  final ValueChanged<TiposAgendamento> onObjectiveChanged;

  const SchedulingPanel({
    super.key,
    required this.selectedObjective,
    required this.onObjectiveChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(27, 17, 27, 36),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.84),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.white.withOpacity(.9),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF2C7180).withOpacity(.10),
            blurRadius: 25,
            offset: Offset(0, 13),
          ),
        ],
      ),
      child: Column(
        children: [
         ScheduleStepper(),
         SizedBox(height: 35),
          ObjectiveSelector(
            selected: selectedObjective,
            onChanged: onObjectiveChanged,
          ),
        ],
      ),
    );
  }
}
