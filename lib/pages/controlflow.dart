import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TrafficLightScreen(),
    );
  }
}

class TrafficLightScreen extends StatefulWidget {
  const TrafficLightScreen({super.key});

  @override
  State<TrafficLightScreen> createState() => _TrafficLightScreenState();
}

class _TrafficLightScreenState extends State<TrafficLightScreen> {
  // Status lampu saat ini: 'MERAH', 'KUNING', atau 'HIJAU'
  String _currentLight = 'MERAH';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTrafficLightTimer();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Batalkan timer saat widget dihancurkan untuk menghindari kebocoran memori
    super.dispose();
  }

  // Fungsi untuk mengubah warna lampu secara berkala secara otomatis
  void _startTrafficLightTimer() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        if (_currentLight == 'MERAH') {
          _currentLight = 'HIJAU'; // Merah ke Hijau
        } else if (_currentLight == 'HIJAU') {
          _currentLight = 'KUNING'; // Hijau ke Kuning
        } else if (_currentLight == 'KUNING') {
          _currentLight = 'MERAH'; // Kuning ke Merah
        }
      });
    });
  }

  // Fungsi untuk mendapatkan warna background berdasarkan status lampu saat ini
  Color _getBackgroundColor() {
    if (_currentLight == 'MERAH') {
      return Colors.red.shade900;
    } else if (_currentLight == 'KUNING') {
      return Colors.amber.shade900;
    } else if (_currentLight == 'HIJAU') {
      return Colors.green.shade900;
    }
    return Colors.black;
  }

  // Fungsi logika *if-else* untuk mengecek aksi tombol yang ditekan user
  void _checkAction(String action) {
    String message = '';
    
    if (action == 'jalan') {
      // Logika untuk tombol JALAN
      if (_currentLight == 'HIJAU') {
        message = 'Anda selamat! 👍';
      } else if (_currentLight == 'MERAH') {
        message = 'Anda kena tilang! 👮‍♂️❌';
      } else if (_currentLight == 'KUNING') {
        message = 'Bahaya! Lampu sudah kuning, Anda harusnya bersiap berhenti.';
      }
    } else if (action == 'berhenti') {
      // Logika untuk tombol BERHENTI
      if (_currentLight == 'MERAH') {
        message = 'Pilihan tepat! Anda mematuhi rambu.';
      } else {
        message = 'Anda berhenti di waktu yang salah, kendaraan belakang bisa menabrak Anda!';
      }
    } else if (action == 'rem') {
      // Logika untuk tombol REM PERLAHAN
      if (_currentLight == 'KUNING') {
        message = 'Bagus! Antisipasi yang tepat saat lampu kuning.';
      } else if (_currentLight == 'HIJAU') {
        message = 'Lampu hijau, kenapa malah mengerem?';
      } else {
        message = 'Lampu sudah merah, Anda harusnya sudah berhenti total!';
      }
    }

    // Tampilkan hasil evaluasi if-else dalam bentuk Pop-up (AlertDialog)
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hasil Keputusan'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background berubah sesuai warna lampu saat ini
      backgroundColor: _getBackgroundColor(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Informasi Status Lampu Saat Ini
              Card(
                color: Colors.white.withValues(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'LAMPU: $_currentLight',
                    style: const TextStyle(
                      fontSize: 28, 
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              
              // Kelompok Tombol Aksi
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                      onPressed: () => _checkAction('jalan'),
                      child: const Text('JALAN', style: TextStyle(fontSize: 18)),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.amber.shade700, foregroundColor: Colors.white),
                      onPressed: () => _checkAction('rem'),
                      child: const Text('REM PERLAHAN', style: TextStyle(fontSize: 18)),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                      onPressed: () => _checkAction('berhenti'),
                      child: const Text('BERHENTI', style: TextStyle(fontSize: 18)),
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
