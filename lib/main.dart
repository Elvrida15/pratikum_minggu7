import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(const MyApp());
}

String formatTanggalIndonesia(DateTime tanggal) {
  return DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(tanggal);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Kuliah',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(fontSize: 16),
          bodyMedium: GoogleFonts.poppins(fontSize: 14),
          titleLarge: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Warna latar belakang aplikasi dibuat agak keabu-abuan
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Praktikum Minggu 7'),
          centerTitle: true,
          backgroundColor: Colors.blue, // Warna AppBar
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            // Menambahkan Card (kotak dengan bayangan)
            child: Card(
              elevation: 4, // Tingkat bayangan
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16), // Sudut melengkung
              ),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Agar kotak menyesuaikan isi
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 40,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Hari ini:',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      formatTanggalIndonesia(DateTime.now()),
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Teks ini memakai font Poppins dari google_fonts.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
