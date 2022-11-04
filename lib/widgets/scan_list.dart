import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';

class ScanList extends StatelessWidget {
  final String tipo;

  const ScanList({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: true);
    final scans = scanListProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, index) => Dismissible(
        key: UniqueKey(),
        background: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.red,
          child: const ListTile(
            leading: Icon(Icons.delete_forever, color: Colors.white, size: 40),
            trailing: Icon(Icons.delete_forever, color: Colors.white, size: 40),
          ),
        ),
        onDismissed: (direction) {
          Provider.of<ScanListProvider>(context, listen: false).borrarScanPorId(scans[index].id!);
        },
        child: ListTile(
          leading: Icon(
            tipo == 'http' 
            ? Icons.home_outlined
            : Icons.map_outlined, 
            color: Theme.of(context).primaryColor
          ),
          title: Text(scans[index].valor),
          subtitle: Text('Id: ${scans[index].id.toString()}'),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () => print(scans[index].id.toString()),
        ),
      ),
    );
  }
}
