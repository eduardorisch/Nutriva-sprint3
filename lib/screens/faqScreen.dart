import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutriva_sprint3/components/faqCard.dart';
import 'package:nutriva_sprint3/components/navbar.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  int? openedIndex = 0;

  final List<Map<String, String>> faqs = [
    {
      'question': 'Quem pode doar leite materno?',
      'answer':
          'Toda nutriz saudável que esteja amamentando, com produção excedente, sem fazer uso de medicamentos contraindicados e que apresente exames pré-natais.',
    },
    {
      'question': 'É seguro? O leite passa por algum controle?',
      'answer':
          'Sim. O leite doado passa por processos de seleção, controle de qualidade, pasteurização e armazenamento adequado.',
    },
    {
      'question': 'Como coletar o leite em casa?',
      'answer':
          'A coleta deve ser realizada com higiene adequada, utilizando recipiente esterilizado e seguindo as orientações do banco de leite.',
    },
    {
      'question': 'Quanto preciso doar?',
      'answer':
          'Não existe uma quantidade mínima obrigatória. Toda quantidade de leite materno doada pode ajudar um bebê.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FAFC),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),

             Navbar(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 710),
                    child: Column(
                      children: [
                        Text(
                          'DÚVIDAS FREQUENTES',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.5,
                            color: const Color(0xFF55C8CA),
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Tudo que você precisa\nsaber.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 32,
                            height: 1.0,
                            fontWeight: FontWeight.w900,
                            color: const Color(0xFF06294C),
                          ),
                        ),

                        const SizedBox(height: 32),

                        ...List.generate(faqs.length, (index) {
                          final faq = faqs[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: FaqCard(
                              question: faq['question']!,
                              answer: faq['answer']!,
                              isOpen: openedIndex == index,
                              onTap: () {
                                setState(() {
                                  openedIndex = openedIndex == index
                                      ? null
                                      : index;
                                });
                              },
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
