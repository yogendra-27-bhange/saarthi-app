import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../theme.dart';
import '../models/mock_places.dart';
import '../models/place.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(28.6139, 77.2090); // Example: Delhi

  Set<Marker> get _markers {
    return mockPlaces.map((place) {
      BitmapDescriptor icon;
      switch (place.type.toLowerCase()) {
        case 'ramp':
          icon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure);
          break;
        case 'elevator':
          icon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange);
          break;
        case 'washroom':
          icon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
          break;
        default:
          icon = BitmapDescriptor.defaultMarker;
      }
      return Marker(
        markerId: MarkerId(place.id),
        position: LatLng(place.latitude, place.longitude),
        infoWindow: InfoWindow(title: place.name, snippet: place.type),
        icon: icon,
      );
    }).toSet();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessible Map'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 14.0,
        ),
        markers: _markers,
        myLocationEnabled: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add_location_alt),
        onPressed: () {
          // TODO: Navigate to Add Place screen
        },
      ),
    );
  }
} 