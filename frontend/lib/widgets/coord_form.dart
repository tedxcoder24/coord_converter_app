import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/coord_converter.dart';
import '../services/api_service.dart';

class CoordForm extends StatefulWidget {
  final void Function(double lat, double lng) onCoordsSubmit;
  final void Function(String dmsLat, String dmsLng) onDMSUpdate;

  const CoordForm({
    required this.onCoordsSubmit,
    required this.onDMSUpdate,
    super.key,
  });

  @override
  State<CoordForm> createState() => _CoordFormState();
}

class _CoordFormState extends State<CoordForm> {
  final _formKey = GlobalKey<FormState>();
  final _latController = TextEditingController();
  final _lngController = TextEditingController();

  Future<void> _convertCoords() async {
    if (_formKey.currentState!.validate()) {
      final double lat = double.parse(_latController.text);
      final double lng = double.parse(_lngController.text);

      final String dmsLat = CoordConverter.toDMS(lat, isLat: true);
      final String dmsLng = CoordConverter.toDMS(lng, isLat: false);

      widget.onCoordsSubmit(lat, lng);
      widget.onDMSUpdate(dmsLat, dmsLng);
    }
  }

  Future<void> _saveCoords() async {
    final double lat = double.parse(_latController.text);
    final double lng = double.parse(_lngController.text);

    final response = await ApiService.saveCoordinates(lat, lng);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          response ? "Coordinates saved!" : "Failed to save coordinates.",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _latController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(labelText: 'Latitude (DD)'),
            validator: (value) {
              final double? parsed = double.tryParse(value ?? '');
              if (parsed == null || parsed < -90 || parsed > 90) {
                return 'Enter a valid latitude (-90 to 90)';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _lngController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(labelText: 'Longitude (DD)'),
            validator: (value) {
              final double? parsed = double.tryParse(value ?? '');
              if (parsed == null || parsed < -180 || parsed > 180) {
                return 'Enter a valid longitude (-180 to 180)';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _convertCoords,
            child: const Text('Convert Coords'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _saveCoords,
            child: const Text('Save to Database'),
          ),
        ],
      ),
    );
  }
}
