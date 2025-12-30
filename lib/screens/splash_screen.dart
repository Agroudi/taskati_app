import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_app/screens/auth_screen.dart';
import 'package:taskati_app/screens/home_screen.dart';
import 'package:taskati_app/widgets/app_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
{
  @override
  void initState()
  {
    super.initState();
    _navigate();
  }

  void _navigate() async
  {
    // splash duration
    await Future.delayed(const Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();

    // Load user data
    AppUser.name = prefs.getString('user_name') ?? '';
    final photoPath = prefs.getString('user_photo');
    if (photoPath != null && photoPath.isNotEmpty)
    {
      AppUser.setImagePath(photoPath);
    }

    // Decide first-time logic
    final bool firstTime = AppUser.name.isEmpty || AppUser.imagePath == null;

    // Navigate accordingly
    if (firstTime)
    {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AuthScreen())
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen())
      );
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/images/Checklist.json'),
          const SizedBox(height: 20),
          const Text(
            'Taskati',
            style: TextStyle(fontSize: 36, fontFamily: 'Poppins-Regular')
          ),
          const SizedBox(height: 30),
          const Text(
            "It's Time To Get Organized",
            style: TextStyle(color: Colors.grey, fontSize: 20)
          )
        ]
      )
    );
  }
}