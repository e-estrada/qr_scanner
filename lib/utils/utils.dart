import 'package:flutter/material.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(BuildContext context, ScanModel scan) async {
  final Uri url = Uri.parse(scan.valor);
  if (scan.tipo == 'http') {
    // Abrir url
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
