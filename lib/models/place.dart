class Place {
  final String id;
  final String name;
  final String type;
  final double latitude;
  final double longitude;
  final String imageUrl;
  final List<String> features;

  Place({
    required this.id,
    required this.name,
    required this.type,
    required this.latitude,
    required this.longitude,
    required this.imageUrl,
    required this.features,
  });

  factory Place.fromMap(Map<String, dynamic> data, String documentId) {
    return Place(
      id: documentId,
      name: data['name'] ?? '',
      type: data['type'] ?? '',
      latitude: (data['latitude'] ?? 0).toDouble(),
      longitude: (data['longitude'] ?? 0).toDouble(),
      imageUrl: data['imageUrl'] ?? '',
      features: List<String>.from(data['features'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'latitude': latitude,
      'longitude': longitude,
      'imageUrl': imageUrl,
      'features': features,
    };
  }
} 