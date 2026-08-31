import 'package:flutter/material.dart';
import 'package:nutriva_sprint3/components/PainelDescritivo.dart';
import 'package:nutriva_sprint3/components/painel_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController(text: 'admin@nutriva.org.br');
  final passwordController = TextEditingController(text: '123456789');
  bool rememberMe = false;
  bool loading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() => loading = true);
    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    setState(() => loading = false);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Login enviado.')));
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
