import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_app/screens/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    push();
    super.initState();
  }

  void push()
  {
    Future.delayed(Duration(seconds: 3, milliseconds: 280),()
    {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AuthScreen()));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/images/Checklist.json'),
          Text(
              'Taskati',
            style: TextStyle(
              fontSize: 36,
              fontFamily: 'Poppins-Regular'
            ),
          ),
          SizedBox(height: 30),
          Text(
              "It's Time To Get Organized",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20
            ),
          )
        ],
      ),
    );
  }
}
