import 'package:flutter/material.dart';
import '../theme.dart';
import '../models/place.dart';
import '../models/mock_places.dart';
import 'home_screen.dart';
import 'dart:math';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  String? _selectedType;
  double? _latitude;
  double? _longitude;
  String? _imageUrl;
  List<String> _features = [];

  // Checkbox states
  bool _wheelchairAccessible = false;
  bool _brailleSignage = false;
  bool _elevatorAvailable = false;

  void _submitForm() {
    if (!_formKey.currentState!.validate() || _selectedType == null) {
      if (_selectedType == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a type.')),
        );
      }
      return;
    }
    // Features list
    List<String> features = [];
    if (_wheelchairAccessible) features.add('Wheelchair Accessible');
    if (_brailleSignage) features.add('Braille Signage');
    if (_elevatorAvailable) features.add('Elevator Available');

    // For mock: random lat/lng and imageUrl
    final random = Random();
    double lat = _latitude ?? 20 + random.nextDouble() * 10;
    double lng = _longitude ?? 70 + random.nextDouble() * 10;
    String imageUrl = _imageUrl ?? '';

    final place = Place(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _nameController.text,
      type: _selectedType!,
      latitude: lat,
      longitude: lng,
      imageUrl: imageUrl,
      features: features,
    );
    mockPlaces.add(place);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Accessible Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Place Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a place name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Type',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'ramp', child: Text('Ramp')),
                    DropdownMenuItem(value: 'elevator', child: Text('Elevator')),
                    DropdownMenuItem(value: 'washroom', child: Text('Washroom')),
                  ],
                  value: _selectedType,
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value;
                    });
                  },
                  validator: (value) => value == null ? 'Please select a type' : null,
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  icon: const Icon(Icons.location_on),
                  label: const Text('Pick Location'),
                  onPressed: () {
                    // TODO: Implement location picker
                    // For now, set random location
                    setState(() {
                      _latitude = 20 + Random().nextDouble() * 10;
                      _longitude = 70 + Random().nextDouble() * 10;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Mock location set!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  icon: const Icon(Icons.photo_camera),
                  label: const Text('Upload Photo'),
                  onPressed: () {
                    // TODO: Implement photo upload
                    // For now, set mock image url
                    setState(() {
                      _imageUrl = 'https://via.placeholder.com/150';
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Mock image set!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Features:'),
                CheckboxListTile(
                  title: const Text('Wheelchair Accessible'),
                  value: _wheelchairAccessible,
                  onChanged: (v) {
                    setState(() {
                      _wheelchairAccessible = v ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Braille Signage'),
                  value: _brailleSignage,
                  onChanged: (v) {
                    setState(() {
                      _brailleSignage = v ?? false;
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Elevator Available'),
                  value: _elevatorAvailable,
                  onChanged: (v) {
                    setState(() {
                      _elevatorAvailable = v ?? false;
                    });
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _submitForm,
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 