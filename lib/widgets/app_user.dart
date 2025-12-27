import 'dart:io';
import 'package:flutter/material.dart';

class AppUser {
  static String name = 'Guest';
  static String? imagePath;

  static ImageProvider? get image {
    if (imagePath != null && File(imagePath!).existsSync()) {
      return FileImage(File(imagePath!));
    }
    return null;
  }

  static void setImagePath(String path) {
    imagePath = path;
  }
}

