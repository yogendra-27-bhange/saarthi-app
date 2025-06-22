import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add a new accessible place
  Future<void> addPlace(Map<String, dynamic> placeData) async {
    await _db.collection('places').add(placeData);
  }

  // Fetch all accessible places
  Stream<QuerySnapshot> getPlaces() {
    return _db.collection('places').snapshots();
  }

  // Fetch a single place by ID
  Future<DocumentSnapshot> getPlaceById(String id) async {
    return await _db.collection('places').doc(id).get();
  }
} 