import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {

  final Completer<GoogleMapController> googleMapController = Completer();
  MapType tipoMapa = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition puntoInicial = CameraPosition(target: scan.getLatLng(), zoom: 17.5, tilt: 50);
    // Marcadores
    Set<Marker> markers = <Marker>{};
    markers.add(Marker(
      markerId: const MarkerId('geo-location'),
      position: scan.getLatLng(),
    ));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        actions: [
          IconButton(
              onPressed: () async {
                final GoogleMapController controller = await googleMapController.future;
                controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                  target: scan.getLatLng(),
                  zoom: 20,
                  tilt: 50,
                )));
              },
              icon: const Icon(Icons.location_on))
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        mapType: tipoMapa,
        markers: markers,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          googleMapController.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers),
        onPressed: () {
          if (tipoMapa == MapType.normal) {
            tipoMapa = MapType.satellite;
          } else {
            tipoMapa = MapType.normal;
          }
          setState(() {});
        },
      ),
    );
  }
}
