import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Latihan Widget Sederhana 1'),
          backgroundColor: Colors.red[800],
          leading: Icon(Icons.home),
        ),
        body: const Center(child: Text('Hello World')),
      ),
    );
  }
}
