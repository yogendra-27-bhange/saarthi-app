import 'package:flutter/material.dart';
import '../models/place.dart';
import '../theme.dart';
import '../screens/place_details_screen.dart';

class PlaceCard extends StatelessWidget {
  final Place place;
  final VoidCallback? onNavigate;
  final VoidCallback? onTap;

  const PlaceCard({super.key, required this.place, this.onNavigate, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      child: ListTile(
        onTap: onTap ?? () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => PlaceDetailsScreen(place: place),
            ),
          );
        },
        leading: place.imageUrl.isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  place.imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 50,
                    height: 50,
                    color: AppColors.secondary.withOpacity(0.2),
                    child: const Icon(Icons.broken_image, color: AppColors.primary, size: 30),
                  ),
                ),
              )
            : Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.secondary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.place, color: AppColors.primary, size: 30),
              ),
        title: Text(place.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${place.type} • ${place.features.join(', ')}'),
        trailing: IconButton(
          icon: const Icon(Icons.navigation, color: AppColors.secondary),
          onPressed: onNavigate,
        ),
      ),
    );
  }
} 