import 'package:flutter/material.dart';
import 'package:qr_scanner/widgets/widgets.dart';

class MapasPage extends StatelessWidget {
  const MapasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanList(tipo: 'geo');
  }
}
