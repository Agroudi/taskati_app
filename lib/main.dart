import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskati_app/screens/auth_screen.dart';
import 'package:taskati_app/screens/home_screen.dart';
import 'package:taskati_app/widgets/app_user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  await Hive.openBox('tasksBox');

  final prefs = await SharedPreferences.getInstance();

  AppUser.name = prefs.getString('user_name') ?? '';
  final photoPath = prefs.getString('user_photo');
  if (photoPath != null && photoPath.isNotEmpty)
  {
    AppUser.setImagePath(photoPath);
  }

  final bool firstTime = AppUser.name.isEmpty || AppUser.imagePath == null;

  runApp(TaskatiApp(firstTime: firstTime));
}

class TaskatiApp extends StatelessWidget {
  final bool firstTime;
  const TaskatiApp({super.key, required this.firstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taskati',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: firstTime ? const AuthScreen() : const HomeScreen(),
    );
  }
}