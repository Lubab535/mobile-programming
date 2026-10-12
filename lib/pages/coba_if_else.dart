import 'package:flutter/material.dart';

void main() {
  runApp(const KategoriUmurApp());
}

class KategoriUmurApp extends StatelessWidget {
  const KategoriUmurApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kategori Umur App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Nilai variabel usia yang bisa diubah-ubah
  int usia = 25; 

  // Fungsi dengan pernyataan if-else untuk menentukan kategori umur
  String dapatkanKategoriUmur(int nilaiUsia) {
    if (nilaiUsia < 12) {
      return "Anak-anak";
    } else if (nilaiUsia >= 12 && nilaiUsia <= 17) {
      return "Remaja";
    } else if (nilaiUsia >= 18 && nilaiUsia <= 64) {
      return "Dewasa";
    } else {
      return "Lansia";
    }
  }

  @override
  Widget build(BuildContext context) {
    // Memanggil fungsi untuk mendapatkan teks kategori
    String kategori = dapatkanKategoriUmur(usia);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori Umur'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Menampilkan informasi usia dan kategorinya',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Text(
                'Usia saat ini: $usia tahun',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 15),
              const Text(
                'Kategori:',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 5),
              Text(
                kategori,
                style: const TextStyle(
                  fontSize: 32, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.blue
                ),
              ),
              const SizedBox(height: 40),
              // Tombol untuk mensimulasikan perubahan usia
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Contoh simulasi: usia bertambah atau diacak
                    usia = (usia + 15) % 80; 
                  });
                },
                child: const Text('Ubah Usia (Simulasi)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
