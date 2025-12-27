import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserName(String name) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('user_name', name);
}

Future<String?> loadUserName() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('user_name');
}

Future<void> saveUserPhoto(String path) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('user_photo', path);
}

Future<String?> loadUserPhoto() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('user_photo');
}
