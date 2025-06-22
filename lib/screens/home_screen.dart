import 'package:flutter/material.dart';
import '../theme.dart';
import '../models/mock_places.dart';
import '../widgets/place_card.dart';
import 'add_place_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saarthi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.location_on, color: AppColors.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Current Location',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.refresh, color: AppColors.secondary),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search accessible places...',
                prefixIcon: Icon(Icons.search, color: AppColors.secondary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: AppColors.card,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                FilterChip(
                  label: const Text('Ramps'),
                  selected: false,
                  onSelected: (v) {},
                  backgroundColor: AppColors.card,
                  selectedColor: AppColors.primary.withOpacity(0.2),
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Elevators'),
                  selected: false,
                  onSelected: (v) {},
                  backgroundColor: AppColors.card,
                  selectedColor: AppColors.primary.withOpacity(0.2),
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Washrooms'),
                  selected: false,
                  onSelected: (v) {},
                  backgroundColor: AppColors.card,
                  selectedColor: AppColors.primary.withOpacity(0.2),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Nearby Accessible Spots',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.textPrimary)),
                ToggleButtons(
                  isSelected: const [true, false],
                  onPressed: (index) {},
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('Map View'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text('List View'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: mockPlaces.isEmpty
                  ? const Center(child: Text('No places added yet.'))
                  : ListView.builder(
                      itemCount: mockPlaces.length,
                      itemBuilder: (context, index) => PlaceCard(place: mockPlaces[index]),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: Hero(
        tag: 'add_place_fab',
        child: FloatingActionButton(
          backgroundColor: AppColors.primary,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AddPlaceScreen()),
            );
          },
        ),
      ),
    );
  }
} 