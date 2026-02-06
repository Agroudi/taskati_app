import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskati_app/screens/home_screen.dart';
import 'package:taskati_app/widgets/app_button.dart';
import 'package:taskati_app/widgets/app_user.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
{
  final ImagePicker picker = ImagePicker();
  final TextEditingController nameController = TextEditingController();
  XFile? photo;

  @override
  void initState() {
    super.initState();
    nameController.text = AppUser.name;
  }

  void openCamera() async
  {
    final picked = await picker.pickImage(source: ImageSource.camera);
    if (picked != null) setState(() => photo = picked);
  }

  void openGallery() async
  {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => photo = picked);
  }

  Future<String> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final fileName = path.basename(imagePath);
    final savedImage = await File(imagePath).copy('${directory.path}/$fileName');
    return savedImage.path;
  }


  void confirm() async {
    if (nameController.text.trim().isEmpty) return;

    AppUser.name = nameController.text.trim();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', AppUser.name);

    if (photo != null) {
      final permanentPath = await saveImagePermanently(photo!.path);
      AppUser.setImagePath(permanentPath);
      await prefs.setString('user_photo', permanentPath);
    }

    Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 85,
                  backgroundColor: Colors.black,
                  backgroundImage: photo != null
                      ? FileImage(File(photo!.path))
                      : (AppUser.imagePath != null
                      ? FileImage(File(AppUser.imagePath!))
                      : null),
                  child: (photo == null && AppUser.imagePath == null)
                      ? Icon(Icons.person_rounded, size: 170, color: Colors.blue.shade900)
                      : null
                ),
                const SizedBox(height: 27),
                AppButton(title: 'Upload From Camera', onPressed: openCamera),
                const SizedBox(height: 12),
                AppButton(title: 'Upload From Gallery', onPressed: openGallery),
                const SizedBox(height: 25),
                const Divider(thickness: 1.2, endIndent: 20, indent: 20),
                const SizedBox(height: 25),
                TextFormField(
                  controller: nameController,
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.blue.shade900)
                    )
                  )
                ),
                const SizedBox(height: 30),
                AppButton(title: 'Confirm', onPressed: confirm)
              ]
            )
          )
        )
      )
    );
  }
}