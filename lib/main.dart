import 'package:flutter/material.dart';
import 'package:aplikasi_kuliahku/aplikasiutama/halamanloginutama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const navy = Color(0xFF123B70);

    return MaterialApp(
      title: 'RuangBelajar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: navy,
          primary: navy,
          secondary: const Color(0xFF69B7F5),
        ),
        scaffoldBackgroundColor: const Color(0xFFF3F8FF),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
