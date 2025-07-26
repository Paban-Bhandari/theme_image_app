import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

/// Service class for handling image picking operations.
class ImageService {
  final ImagePicker _picker = ImagePicker();

  /// Picks an image from the camera.
  Future<XFile?> pickImageFromCamera() async {
    try {
      return await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 85,
      );
    } catch (e) {
      throw Exception('Error accessing camera: $e');
    }
  }

  /// Picks an image from the gallery.
  Future<XFile?> pickImageFromGallery() async {
    try {
      return await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 85,
      );
    } catch (e) {
      throw Exception('Error accessing gallery: $e');
    }
  }

  /// Processes the picked image for web or mobile platforms.
  Future<dynamic> processImage(XFile image) async {
    if (kIsWeb) {
      return await image.readAsBytes();
    } else {
      return File(image.path);
    }
  }
}
