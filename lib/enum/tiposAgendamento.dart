enum TiposAgendamento { 
  doacao, 
  visita, 
  evento 
}

extension TiposAgendamentoDetails on TiposAgendamento {
  String get titulo {
    switch (this) {
      case TiposAgendamento.doacao:
        return 'Doar leite';
      case TiposAgendamento.visita:
        return 'Conhecer o posto';
      case TiposAgendamento.evento:
        return 'Participar de evento';
    }
  }

  String get descricao {
    switch (this) {
      case TiposAgendamento.doacao:
        return 'Já amamento e quero doar\nmeu excedente.';
      case TiposAgendamento.visita:
        return 'Quero visitar antes de me\ndecidir.';
      case TiposAgendamento.evento:
        return 'Rodas de conversa e ações\neducativas.';
    }
  }
}
