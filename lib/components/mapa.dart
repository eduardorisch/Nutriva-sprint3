import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:nutriva_sprint3/model/banco_leite.dart';

class MapaBancos extends StatelessWidget {
  final LatLng centro;
  final List<BancoLeite> bancos;
  final BancoLeite? selecionado;
  final Function(BancoLeite) onBancoSelecionado;

  const MapaBancos({
    super.key,
    required this.centro,
    required this.bancos,
    required this.selecionado,
    required this.onBancoSelecionado,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: FlutterMap(
        options: MapOptions(initialCenter: centro, initialZoom: 13),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.nutrivera',
          ),

          MarkerLayer(
            markers: [
              // Local do usuário
              Marker(
                point: centro,
                width: 50,
                height: 50,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF062B55),
                    border: Border.all(color: Colors.white, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Icon(Icons.location_on, color: Colors.white, size: 24),
                ),
              ),

              // Bancos
              ...bancos.map((banco) {
                final isSelected = banco.nome == selecionado?.nome;

                return Marker(
                  point: LatLng(banco.latitude, banco.longitude),
                  width: 42,
                  height: 42,
                  child: GestureDetector(
                    onTap: () => onBancoSelecionado(banco),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? Color(0xFF062B55) : Colors.white,
                        border: Border.all(
                          color: Color(0xFF062B55),
                          width: isSelected ? 3 : 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: isSelected ? Colors.white : Color(0xFF062B55),
                        size: 21,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
