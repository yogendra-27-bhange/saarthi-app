import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme.dart';
import '../models/place.dart';

class PlaceDetailsScreen extends StatelessWidget {
  final Place place;
  const PlaceDetailsScreen({super.key, required this.place});

  void _openMaps() async {
    final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=${place.latitude},${place.longitude}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            place.imageUrl.isNotEmpty
                ? Image.network(place.imageUrl, width: double.infinity, height: 200, fit: BoxFit.cover)
                : Container(
                    width: double.infinity,
                    height: 200,
                    color: AppColors.card,
                    child: const Icon(Icons.image, size: 100, color: AppColors.secondary),
                  ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Lat: ${place.latitude.toStringAsFixed(4)}, Lng: ${place.longitude.toStringAsFixed(4)}',
                    style: const TextStyle(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      Chip(
                        label: Text(place.type),
                        backgroundColor: AppColors.secondary.withOpacity(0.2),
                      ),
                      ...place.features.map((f) => Chip(
                            label: Text(f),
                            backgroundColor: AppColors.secondary.withOpacity(0.2),
                          )),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.navigation),
                      label: const Text('Navigate'),
                      onPressed: _openMaps,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text('Reviews:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary)),
                  const SizedBox(height: 8),
                  ListTile(
                    leading: CircleAvatar(child: Icon(Icons.person)),
                    title: Text('Great accessibility!'),
                    subtitle: Text('by User1'),
                  ),
                  ListTile(
                    leading: CircleAvatar(child: Icon(Icons.person)),
                    title: Text('Clean washroom.'),
                    subtitle: Text('by User2'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 