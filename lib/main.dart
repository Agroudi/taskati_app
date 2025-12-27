import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taskati_app/screens/splash_screen.dart';

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  Directory appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  await Hive.openBox('tasksBox');

  runApp(const TaskatiApp());
}

class TaskatiApp extends StatelessWidget
{
  const TaskatiApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taskati',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen()
    );
  }
}