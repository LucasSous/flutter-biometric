import 'package:flutter/material.dart';
import 'package:flutter_biometric/app/pages/home_page.dart';
import 'package:flutter_biometric/app/pages/login_page.dart';
import 'package:flutter_biometric/app/pages/welcome_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
