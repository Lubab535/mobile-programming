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
          backgroundColor: Colors.green[800],
          leading: const Icon(Icons.home),
          title: const Text('Latihan Widget Layout Flutter Layout'),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Icon(Icons.archive),
                  const SizedBox(width: 8),
                  const Text(
                    'Artikel Terbaru',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(
                      'https://pisa.bantulkab.go.id/storage/pisa/child_information/7u1bprN2JaG18meC4Uw3rz738CKOeQjcGTyW2exJ.jpg',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                      errorBuilder: (context, error, stackTrace) =>
                          const SizedBox(
                            height: 200,
                            child: Center(child: Text('Gambar gagal dimuat')),
                          ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Candi Borobudur',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
