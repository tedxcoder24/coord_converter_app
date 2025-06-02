import 'package:flutter/material.dart';

class DMSDisplay extends StatelessWidget {
  final String dmsLat;
  final String dmsLng;

  const DMSDisplay({required this.dmsLat, required this.dmsLng, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.grey[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Converted Coordinates (DMS)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text('Latitude: $dmsLat'),
            Text('Longitude: $dmsLng'),
          ],
        ),
      ),
    );
  }
}
