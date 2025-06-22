import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Upload image and return download URL
  Future<String?> uploadPlaceImage(File imageFile) async {
    try {
      final ref = _storage.ref().child('place_images/${DateTime.now().millisecondsSinceEpoch}.jpg');
      final uploadTask = await ref.putFile(imageFile);
      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      // TODO: Handle error
      return null;
    }
  }
} 