import 'package:flutter/material.dart';
import 'package:flutter_biometric/app/domain/controllers/biometrics_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final BiometricsLogin _biometricsLogin = BiometricsLogin();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    authenticate();
  }

  Future<void> authenticate() async {
    bool verification = await _biometricsLogin.authenticate();
    if (verification) {
      _emailController.text = 'email@gmail.com';
      _passwordController.text = 'senha123';
    } else {
      print('Não deu bom');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-mail',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                child: const Text('LOGIN'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login() {
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, '/home');
  }
}
