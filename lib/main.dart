import 'package:flutter/material.dart';
import 'package:qr_scanner/pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Scanner',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomePage(),
        'mapa': (_) => const MapaPage()
      },
    );
  }
}