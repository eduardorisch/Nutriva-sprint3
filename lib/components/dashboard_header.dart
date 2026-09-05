import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: 40),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE9EDF2))),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1320),
          child: Row(
            children: [
              const Logo(),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Nutriva',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF172033),
                      height: 1.1,
                    ),
                  ),
                  Text(
                    'ADMIN DASHBOARD',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      letterSpacing: .4,
                      color: Color(0xFF9AA3B2),
                      height: 1.1,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: Color(0xFF1BB6A5),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 7),
              const Text(
                'Dados em tempo real',
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xFF7B8496),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 22),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Color(0xFF7B8496),
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(32, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text('Sair', style: TextStyle(fontSize: 10)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: Color(0xFF24395C),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        Icons.water_drop_outlined,
        color: Colors.white,
        size: 14,
      ),
    );
  }
}
