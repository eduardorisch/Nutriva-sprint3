import 'package:flutter/material.dart';
import 'package:nutriva_sprint3/components/painel_descritivo.dart';
import 'package:nutriva_sprint3/components/painel_login.dart';
import 'package:nutriva_sprint3/navigation/AppRoutes.dart';
import 'package:nutriva_sprint3/screens/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberMe = false;
  bool loading = false;

  static const _emailValido = 'admin@nutriva.org.br';
  static const _senhaValida = '123456789';

  Future<void> _login() async {
    final email = emailController.text.trim();
    final senha = passwordController.text;

    if (email.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Preencha e-mail e senha.')));
      return;
    }

    setState(() => loading = true);
    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    setState(() => loading = false);

    final valido = email == _emailValido && senha == _senhaValida;

    if (valido) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const Dashboardscreen()),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('E-mail ou senha incorretos.')),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(flex: 505, child: BrandPanel()),
          Expanded(
            flex: 495,
            child: LoginPainel(
              emailController: emailController,
              passwordController: passwordController,
              rememberMe: rememberMe,
              loading: loading,
              onRememberChanged: (value) {
                setState(() => rememberMe = value);
              },
              onLogin: _login,
            ),
          ),
        ],
      ),
    );
  }
}
