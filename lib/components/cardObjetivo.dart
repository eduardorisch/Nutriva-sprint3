import 'package:flutter/material.dart';
import 'package:nutriva_sprint3/enum/tiposAgendamento.dart';


class ObjectivoCard extends StatelessWidget {
  final TiposAgendamento objetivo;
  final bool selected;
  final VoidCallback onTap;

  const ObjectivoCard({
    super.key,
    required this.objetivo,
    required this.selected,
    required this.onTap,
  });

  IconData get _icon {
    switch (objetivo) {
      case TiposAgendamento.doacao:
        return Icons.water_drop_outlined;
      case TiposAgendamento.visita:
        return Icons.location_on_outlined;
      case TiposAgendamento.evento:
        return Icons.notes_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final titleColor =
        selected ? Colors.white : Color(0xFF082F55);
    final bodyColor =
        selected ? Color(0xFFD5E4EE) : Color(0xFF69747D);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 180),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: selected ? Color(0xFF062D54) : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: selected
                  ? Color(0xFF062D54)
                  : Color(0xFFE1E8EA),
            ),
            boxShadow: [
              if (selected)
                BoxShadow(
                  color: Color(0xFF092F50).withOpacity(.15),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: selected
                      ? Color(0xFF0BC3C7)
                      : Color(0xFFD9F3F3),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _icon,
                  color: selected
                      ? Color(0xFF07365D)
                      : Color(0xFF24627B),
                  size: 19,
                ),
              ),
             SizedBox(height: 13),
              Text(
                objetivo.titulo,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
             SizedBox(height: 5),
              Text(
                objetivo.descricao,
                style: TextStyle(
                  color: bodyColor,
                  height: 1.25,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
