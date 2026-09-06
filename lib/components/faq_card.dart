import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqCard extends StatelessWidget {
  final String question;
  final String answer;
  final bool isOpen;
  final VoidCallback onTap;

  const FaqCard({
    super.key,
    required this.question,
    required this.answer,
    required this.isOpen,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isOpen
              ?  Color(0xFF80DADC)
              :  Color(0xFFE8EEF1),
          width: isOpen ? 1.5 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 11,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      question,
                      style: GoogleFonts.inter(
                        color:  Color(0xFF06294C),
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),

                   SizedBox(width: 10),

                  Container(
                    width: 21,
                    height: 21,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isOpen
                          ?  Color(0xFF06294C)
                          :  Color(0xFFE8F2F4),
                    ),
                    child: Icon(
                      isOpen ? Icons.close : Icons.add,
                      size: 13,
                      color: isOpen
                          ? Colors.white
                          :  Color(0xFF4D7684),
                    ),
                  ),
                ],
              ),

              AnimatedCrossFade(
                duration: Duration(milliseconds: 200),
                crossFadeState: isOpen
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstChild:  SizedBox.shrink(),
                secondChild: Padding(
                  padding:  EdgeInsets.only(
                    top: 12,
                    right: 30,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      answer,
                      style: GoogleFonts.inter(
                        color:  Color(0xFF7B858C),
                        fontSize: 12,
                        height: 1.45,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}