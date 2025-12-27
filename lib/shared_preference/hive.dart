import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppUser {
  static String name = "User";
  static String photo = "";

  static ImageProvider? get image
  {
    if (photo.isEmpty) return null;
    return FileImage(File(photo));
  }
}

Future<void> saveUserName(String newName) async
{
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('user_name', newName);
  AppUser.name = newName;
}

Future<void> loadUserName() async
{
  final prefs = await SharedPreferences.getInstance();
  AppUser.name = prefs.getString('user_name') ?? "User";
}

Future<void> saveUserPhoto(String path) async
{
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('user_photo', path);
  AppUser.photo = path;
}

Future<void> loadUserPhoto() async
{
  final prefs = await SharedPreferences.getInstance();
  AppUser.photo = prefs.getString('user_photo') ?? "";
}