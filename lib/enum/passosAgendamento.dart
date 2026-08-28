enum PassosAgendamento {
  objetivo,
  posto,
  dataHorario,
  triagem,
}

extension PassosAgendamentoDetails on PassosAgendamento {
  String get label {
    switch (this) {
      case PassosAgendamento.objetivo:
        return 'Objetivo';
      case PassosAgendamento.posto:
        return 'Posto';
      case PassosAgendamento.dataHorario:
        return 'Data e horário';
      case PassosAgendamento.triagem:
        return 'Triagem';
    }
  }
}
