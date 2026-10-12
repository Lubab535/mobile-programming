import 'package:flutter/material.dart';

void main() {
  runApp(const KelipatanApp());
}

class KelipatanApp extends StatelessWidget {
  const KelipatanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'While Loop Kelipatan',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const KelipatanPage(),
    );
  }
}

class KelipatanPage extends StatefulWidget {
  const KelipatanPage({super.key});

  @override
  State<KelipatanPage> createState() => _KelipatanPageState();
}

class _KelipatanPageState extends State<KelipatanPage> {
  // Controller untuk menangkap input teks
  final TextEditingController _controllerM = TextEditingController();
  final TextEditingController _controllerN = TextEditingController();

  int _m = 0; // Nilai kelipatan
  int _n = 0; // Banyaknya data

  // Fungsi untuk menghasilkan baris angka menggunakan while loop
  List<Widget> _hitungKelipatan(int kelipatan, int jumlahData) {
    List<Widget> daftarWidget = [];
    
    int counter = 1; // Variabel kontrol perulangan
    int hasilKelipatan = kelipatan;

    // Menghitung kelipatan m sebanyak n kali menggunakan while loop
    while (counter <= jumlahData) {
      daftarWidget.add(
        Container(
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.teal.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.teal.shade200),
          ),
          child: Text(
            '$hasilKelipatan',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ),
      );

      // Tambahkan nilai kelipatan untuk iterasi berikutnya
      hasilKelipatan += kelipatan;
      // Naikkan nilai counter agar loop tidak berjalan selamanya (infinite loop)
      counter++;
    }

    return daftarWidget;
  }

  @override
  void dispose() {
    _controllerM.dispose();
    _controllerN.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelipatan M dari N (While Loop)'),
        backgroundColor: Colors.teal.shade100,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                // Input untuk nilai kelipatan (m)
                Expanded(
                  child: TextField(
                    controller: _controllerM,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Kelipatan (m)',
                      hintText: 'Contoh: 5',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Input untuk jumlah angka (n)
                Expanded(
                  child: TextField(
                    controller: _controllerN,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Banyak data (n)',
                      hintText: 'Contoh: 7',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Tombol untuk memicu kalkulasi
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _m = int.tryParse(_controllerM.text) ?? 0;
                  _n = int.tryParse(_controllerN.text) ?? 0;
                });
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Hitung Kelipatan'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            const SizedBox(height: 24),
            
            Text(
              'Hasil Kelipatan $_m Sebanyak $_n Data:',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            
            // Menampilkan deretan widget hasil looping
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 4.0,
                  runSpacing: 4.0,
                  children: (_m > 0 && _n > 0) 
                      ? _hitungKelipatan(_m, _n) 
                      : [const Text('Masukkan angka m dan n terlebih dahulu.')],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
