class BancoLeite {
  final String nome;
  final String tipo;
  final String endereco;
  final String horario;
  final double latitude;
  final double longitude;

  double? distanciaKm;

  BancoLeite({
    required this.nome,
    required this.tipo,
    required this.endereco,
    required this.horario,
    required this.latitude,
    required this.longitude,
    this.distanciaKm,
  });
}