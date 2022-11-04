import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.QR);
        // const barcodeScanRes = 'http://eestrada.com';
        // const barcodeScanRes = 'geo:25.787113336470963, -100.31555628926071';
        const barcodeScanRes = 'geo:25.8042109290986, -100.34246844608083';
        
        if (barcodeScanRes == '-1') return;

        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
        await openUrl(context, nuevoScan);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
