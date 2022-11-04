import 'package:flutter/material.dart';
import 'package:qr_scanner/widgets/widgets.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanList(tipo: 'http');
  }
}