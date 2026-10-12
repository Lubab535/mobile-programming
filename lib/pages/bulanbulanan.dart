import 'package:flutter/material.dart';

void main() {
  runApp(const CekHariApp());
}

class CekHariApp extends StatelessWidget {
  const CekHariApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cek Jumlah Hari',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const CekHariPage(),
    );
  }
}

class CekHariPage extends StatefulWidget {
  const CekHariPage({super.key});

  @override
  State<CekHariPage> createState() => _CekHariPageState();
}

class _CekHariPageState extends State<CekHariPage> {
  // Controller untuk menangkap input angka dari pengguna
  final TextEditingController _bulanController = TextEditingController();
  
  // Variabel untuk menyimpan pesan hasil switch statement
  String _hasilTeks = 'Masukkan angka 1-12 untuk melihat jumlah hari.';

  // Fungsi switch statement untuk menentukan jumlah hari
  void _hitungJumlahHari(int? nomorBulan) {
    setState(() {
      if (nomorBulan == null || nomorBulan < 1 || nomorBulan > 12) {
        _hasilTeks = 'Input tidak valid! Harap masukkan angka antara 1 hingga 12.';
        return;
      }

      // Penerapan switch statement sesuai logika kalender (mengasumsikan tahun kabisat standard/28 hari untuk Februari)
      switch (nomorBulan) {
        case 1: // Januari
        case 3: // Maret
        case 5: // Mei
        case 7: // Juli
        case 8: // Agustus
        case 10: // Oktober
        case 12: // Desember
          _hasilTeks = 'Bulan ke-$nomorBulan memiliki 31 hari.';
          break;
          
        case 4: // April
        case 6: // Juni
        case 9: // September
        case 11: // November
          _hasilTeks = 'Bulan ke-$nomorBulan memiliki 30 hari.';
          break;
          
        case 2: // Februari
          _hasilTeks = 'Bulan ke-$nomorBulan memiliki 28 hari (atau 29 hari pada tahun kabisat).';
          break;
          
        default:
          _hasilTeks = 'Bulan tidak dikenal.';
      }
    });
  }

  @override
  void dispose() {
    _bulanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hitung Jumlah Hari'),
        backgroundColor: Colors.blue.shade100,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Cek Jumlah Hari dalam Sebulan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // Kotak Input Angka Bulan
            TextField(
              controller: _bulanController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nomor Bulan (1-12)',
                hintText: 'Masukkan angka, misal: 2 untuk Februari',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calendar_month),
              ),
            ),
            const SizedBox(height: 20),
            
            // Tombol untuk memproses input
            ElevatedButton(
              onPressed: () {
                // Mengubah teks input menjadi integer (jika bukan angka akan bernilai null)
                int? bulan = int.tryParse(_bulanController.text);
                _hitungJumlahHari(bulan);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: const Text('Cek Jumlah Hari'),
            ),
            const SizedBox(height: 40),
            
            // Wadah untuk menampilkan hasil penentuan switch statement
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Text(
                _hasilTeks,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
