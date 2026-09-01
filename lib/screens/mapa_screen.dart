import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:nutriva_sprint3/components/card_banco.dart';
import 'package:nutriva_sprint3/components/mapa.dart';
import 'package:nutriva_sprint3/components/navbar.dart';
import 'package:nutriva_sprint3/data/bancos_mock.dart';
import 'package:nutriva_sprint3/data/cep_mock.dart';
import 'package:nutriva_sprint3/model/banco_leite.dart';

class MapaScreen extends StatefulWidget {
  const MapaScreen({super.key});

  @override
  State<MapaScreen> createState() => _MapaScreen();
}

class _MapaScreen extends State<MapaScreen> {
  final TextEditingController cepController = TextEditingController();

  LatLng centro = LatLng(-23.5614, -46.6560);

  List<BancoLeite> bancos = [];

  BancoLeite? selecionado;

  @override
  void initState() {
    super.initState();

    _buscarPorCep('01310-100');
  }

  void _buscarPorCep(String cep) {
    final cepFormatado = _formatarCep(cep);

    final localizacao = cepsMock[cepFormatado];

    if (localizacao == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('CEP não encontrado.')));

      return;
    }

    centro = localizacao;

    final distance = Distance();

    final resultados = bancosMock.map((banco) {
      final distancia = distance.as(
        LengthUnit.Kilometer,
        centro,
        LatLng(banco.latitude, banco.longitude),
      );

      return BancoLeite(
        nome: banco.nome,
        tipo: banco.tipo,
        endereco: banco.endereco,
        horario: banco.horario,
        latitude: banco.latitude,
        longitude: banco.longitude,
        distanciaKm: distancia,
      );
    }).toList();

    resultados.sort((a, b) => a.distanciaKm!.compareTo(b.distanciaKm!));

    setState(() {
      bancos = resultados;
      selecionado = resultados.isNotEmpty ? resultados.first : null;
    });
  }

  String _formatarCep(String cep) {
    final numeros = cep.replaceAll(RegExp(r'[^0-9]'), '');

    if (numeros.length == 8) {
      return '${numeros.substring(0, 5)}-${numeros.substring(5)}';
    }

    return cep;
  }

  void _selecionarBanco(BancoLeite banco) {
    setState(() {
      selecionado = banco;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5FAFB),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Navbar(),
              Text(
                'POSTOS PRÓXIMOS',
                style: GoogleFonts.inter(
                  color: Color(0xFF159A9C),
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Encontre onde doar',
                style: GoogleFonts.inter(
                  color: Color(0xFF062B55),
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Mais de 2.000 pontos de coleta no Brasil. '
                      'Digite seu CEP ou use sua localização atual.',
                      style: GoogleFonts.inter(
                        color: Color(0xFF66747E),
                        fontSize: 11,
                        height: 1.4,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  SizedBox(
                    width: 270,
                    child: BuscaCep(
                      controller: cepController,
                      onBuscar: () {
                        _buscarPorCep(cepController.text);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 6,
                      child: MapaBancos(
                        centro: centro,
                        bancos: bancos,
                        selecionado: selecionado,
                        onBancoSelecionado: _selecionarBanco,
                      ),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      flex: 4,
                      child: ListaBancos(
                        bancos: bancos,
                        selecionado: selecionado,
                        onBancoSelecionado: _selecionarBanco,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    cepController.dispose();
    super.dispose();
  }
}

class BuscaCep extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onBuscar;

  const BuscaCep({super.key, required this.controller, required this.onBuscar});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 18),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Digite seu CEP',
                border: InputBorder.none,
                isDense: true,
              ),
              onSubmitted: (_) => onBuscar(),
            ),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFE8F2F5),
            ),
            child: Icon(Icons.add, size: 18),
          ),
          SizedBox(width: 8),
          GestureDetector(
            onTap: onBuscar,
            child: Container(
              height: 34,
              padding: EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Color(0xFF062B55),
                borderRadius: BorderRadius.circular(18),
              ),
              alignment: Alignment.center,
              child: Text(
                'Buscar',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          SizedBox(width: 6),
        ],
      ),
    );
  }
}

class ListaBancos extends StatelessWidget {
  final List<BancoLeite> bancos;
  final BancoLeite? selecionado;
  final Function(BancoLeite) onBancoSelecionado;

  const ListaBancos({
    super.key,
    required this.bancos,
    required this.selecionado,
    required this.onBancoSelecionado,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: bancos.length,
      itemBuilder: (context, index) {
        final banco = bancos[index];

        return BancoCard(
          banco: banco,
          selecionado: banco.nome == selecionado?.nome,
          onTap: () => onBancoSelecionado(banco),
        );
      },
    );
  }
}
