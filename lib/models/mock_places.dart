import 'place.dart';

// Global mock list of places
List<Place> mockPlaces = [
  Place(
    id: '1',
    name: 'City Mall Ramp',
    type: 'ramp',
    latitude: 28.6139,
    longitude: 77.2090,
    imageUrl: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=400&q=80',
    features: ['Wheelchair Accessible'],
  ),
  Place(
    id: '2',
    name: 'Metro Elevator',
    type: 'elevator',
    latitude: 28.6145,
    longitude: 77.2085,
    imageUrl: 'https://images.unsplash.com/photo-1464983953574-0892a716854b?auto=format&fit=crop&w=400&q=80',
    features: ['Elevator Available', 'Braille Signage'],
  ),
  Place(
    id: '3',
    name: 'Central Park Washroom',
    type: 'washroom',
    latitude: 28.6150,
    longitude: 77.2100,
    imageUrl: 'https://images.unsplash.com/photo-1506784365847-bbad939e9335?auto=format&fit=crop&w=400&q=80',
    features: ['Wheelchair Accessible'],
  ),
  Place(
    id: '4',
    name: 'Library Ramp',
    type: 'ramp',
    latitude: 28.6160,
    longitude: 77.2110,
    imageUrl: '',
    features: ['Wheelchair Accessible', 'Braille Signage'],
  ),
]; 