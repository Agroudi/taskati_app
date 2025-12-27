import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taskati_app/screens/splash_screen.dart';
import 'package:taskati_app/widgets/app_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path); // <- initialize Hive manually
  await Hive.openBox('tasksBox');

  final prefs = await SharedPreferences.getInstance();
  AppUser.name = prefs.getString('user_name') ?? 'Guest';
  final photoPath = prefs.getString('user_photo');
  if (photoPath != null) {
    AppUser.imagePath = photoPath;
  }

  runApp(const TaskatiApp());
}

class TaskatiApp extends StatelessWidget {
  const TaskatiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taskati',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}