import 'package:flutter/material.dart';
import '../widgets/coord_form.dart';
import '../widgets/dms_display.dart';
import '../widgets/map_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double? latitude;
  double? longitude;
  String? dmsLat;
  String? dmsLng;

  void onCoordsChanged(double lat, double lng) {
    setState(() {
      latitude = lat;
      longitude = lng;
    });
  }

  void onDMSChanged(String dmsLatStr, String dmsLngStr) {
    setState(() {
      dmsLat = dmsLatStr;
      dmsLng = dmsLngStr;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coord Converter')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CoordForm(
              onCoordsSubmit: onCoordsChanged,
              onDMSUpdate: onDMSChanged,
            ),
            const SizedBox(height: 20),
            if (dmsLat != null && dmsLng != null)
              DMSDisplay(dmsLat: dmsLat!, dmsLng: dmsLng!),
            const SizedBox(height: 20),
            if (latitude != null && longitude != null)
              MapWidget(lat: latitude!, lng: longitude!),
          ],
        ),
      ),
    );
  }
}
