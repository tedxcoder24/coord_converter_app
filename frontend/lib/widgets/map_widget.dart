import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final double lat;
  final double lng;

  const MapWidget({required this.lat, required this.lng, super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController _mapController;
  final LatLng _defaultPosition = const LatLng(27.9506, -82.4572); // Tampa Bay

  @override
  Widget build(BuildContext context) {
    final LatLng targetPosition = LatLng(widget.lat, widget.lng);

    return SizedBox(
      height: 300,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(target: targetPosition, zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        markers: {
          Marker(
            markerId: const MarkerId('convertedLocation'),
            position: targetPosition,
            infoWindow: const InfoWindow(title: 'Target Coordinates'),
          ),
        },
      ),
    );
  }
}
