import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPainel extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool rememberMe;
  final bool loading;
  final ValueChanged<bool> onRememberChanged;
  final VoidCallback onLogin;

  const LoginPainel({
    required this.emailController,
    required this.passwordController,
    required this.rememberMe,
    required this.loading,
    required this.onRememberChanged,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF7FBFE),
      child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 40),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 380),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ACESSO RESTRITO',
                  style: GoogleFonts.inter(
                    color: Color(0xFF28B7B5).withOpacity(.78),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Entre na sua conta',
                  style: GoogleFonts.inter(
                    color: Color(0xFF071B32),
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -.3,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Acesso exclusivo para gestores e parceiros institucionais.',
                  style: GoogleFonts.inter(
                    color: Color(0xFF637080).withOpacity(.85),
                    fontSize: 8,
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'E-mail',
                  style: GoogleFonts.inter(
                    color: Color(0xFF516172),
                    fontSize: 7,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6),
                _Input(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  dica: 'admin@nutriva.org.br',
                ),
                SizedBox(height: 12),
                Text(
                  'Senha',
                  style: GoogleFonts.inter(
                    color: Color(0xFF516172),
                    fontSize: 7,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6),
                _Input(controller: passwordController,
                 obscureText: true,
                  dica: '123456789',
                  ),
                SizedBox(height: 6),
                Row(
                  children: [
                    SizedBox(
                      width: 18,
                      height: 18,
                      child: Checkbox(
                        value: rememberMe,
                        onChanged: (value) {
                          onRememberChanged(value ?? false);
                        },
                        side: BorderSide(color: Color(0xFFD3DEE7), width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Lembrar-me',
                      style: GoogleFonts.inter(
                        color: Color(0xFF687786),
                        fontSize: 7,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Esqueci a senha',
                        style: GoogleFonts.inter(
                          color: Color(0xFF20AFAF),
                          fontSize: 7,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 30,
                  child: FilledButton(
                    onPressed: loading ? null : onLogin,
                    style: FilledButton.styleFrom(
                      backgroundColor: Color(0xFF002044),
                      disabledBackgroundColor: Color(0xFF617188),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: loading
                        ? SizedBox(
                            width: 13,
                            height: 13,
                            child: CircularProgressIndicator(
                              strokeWidth: 1.5,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Entrar no painel',
                            style: GoogleFonts.inter(
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 11),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      '←  Voltar ao site',
                      style: GoogleFonts.inter(
                        color: Color(0xFF9AA6B2),
                        fontSize: 8,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Input extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? dica;

  const _Input({
    required this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.dica
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: GoogleFonts.inter(fontSize: 8, color: Color(0xFF263746)),
        cursorColor: Color(0xFF20AFAF),
        decoration: InputDecoration(
          hintText: dica,
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: Color(0xFFE4EBF0), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: Color(0xFFE4EBF0), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: Color(0xFF2AB8B5), width: 1),
          ),
        ),
      ),
    );
  }
}
