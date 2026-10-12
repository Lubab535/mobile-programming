import 'package:flutter/material.dart';

void main() {
  runApp(const LoopAngkaApp());
}

class LoopAngkaApp extends StatelessWidget {
  const LoopAngkaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'For Loop Flutter',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const LoopAngkaPage(),
    );
  }
}

class LoopAngkaPage extends StatefulWidget {
  const LoopAngkaPage({super.key});

  @override
  State<LoopAngkaPage> createState() => _LoopAngkaPageState();
}

class _LoopAngkaPageState extends State<LoopAngkaPage> {
  // Controller untuk mengambil input teks dari user
  final TextEditingController _inputController = TextEditingController();
  
  // Variabel untuk menyimpan nilai n (panjang baris)
  int _n = 0;

  // Fungsi untuk menghasilkan baris angka menggunakan for loop
  List<Widget> _buatBarisAngka(int panjang) {
    List<Widget> daftarWidgetAngka = [];

    // For Loop untuk membuat teks angka 1 hingga n
    for (int i = 1; i <= panjang; i++) {
      daftarWidgetAngka.add(
        Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.deepPurple.shade200),
          ),
          child: Text(
            '$i',
            style: const TextStyle(
              fontSize: 18, 
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
        ),
      );
    }

    return daftarWidgetAngka;
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tampilkan Angka 1 hingga N'),
        backgroundColor: Colors.deepPurple.shade100,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Kotak input untuk me-request panjang n
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan panjang angka (n)',
                hintText: 'Contoh: 10',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.format_list_numbered),
              ),
            ),
            const SizedBox(height: 16),
            
            // Tombol untuk memproses dan memicu perubahan layar
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  // Mengubah string input menjadi integer, jika kosong/error default ke 0
                  _n = int.tryParse(_inputController.text) ?? 0;
                });
              },
              icon: const Icon(Icons.play_arrow),
              label: const Text('Tampilkan Baris Angka'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            const SizedBox(height: 24),
            
            const Text(
              'Hasil Baris Angka:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            
            // Wadah pembungkus agar susunan angka otomatis turun ke bawah jika penuh (Wrap)
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 4.0, // Jarak horizontal antar angka
                  runSpacing: 4.0, // Jarak vertikal jika baris berganti
                  children: _buatBarisAngka(_n),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
