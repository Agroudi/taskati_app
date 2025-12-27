import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskati_app/screens/home_screen.dart';
import 'package:taskati_app/widgets/app_button.dart';
import 'package:taskati_app/widgets/app_user.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final ImagePicker picker = ImagePicker();
  final TextEditingController nameController = TextEditingController();

  XFile? photo;

  void openCamera() async {
    final picked = await picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      setState(() {
        photo = picked;
      });
    }
  }

  void openGallery() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        photo = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // AVATAR (SAFE)
              CircleAvatar(
                radius: 85,
                backgroundColor: Colors.black,
                backgroundImage:
                photo != null ? FileImage(File(photo!.path)) : null,
                child: photo == null
                    ? Icon(
                  Icons.person_rounded,
                  size: 170,
                  color: Colors.blue.shade900,
                )
                    : null,
              ),

              const SizedBox(height: 27),

              AppButton(
                title: 'Upload From Camera',
                onPressed: openCamera,
              ),

              const SizedBox(height: 12),

              AppButton(
                title: 'Upload From Gallery',
                onPressed: openGallery,
              ),

              const SizedBox(height: 25),

              const Divider(thickness: 1.2, endIndent: 20, indent: 20),

              const SizedBox(height: 25),

              // NAME FIELD
              TextFormField(
                controller: nameController,
                onTapOutside: (_) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue.shade900),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              AppButton(
                title: 'Confirm',
                onPressed: () async
                {
                  if (nameController.text.trim().isEmpty) return;

                  AppUser.name = nameController.text.trim();

                  if (photo != null)
                  {
                    AppUser.setImagePath(photo!.path);
                  }

                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('user_name', AppUser.name);
                  if (photo != null)
                  {
                    await prefs.setString('user_photo', AppUser.imagePath!);
                  }

                  setState(() {});
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()));
                  },
              )
            ],
          ),
        ),
      ),
    );
  }
}
