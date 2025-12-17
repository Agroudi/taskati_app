import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_app/widgets/app_button.dart';

class AuthScreen extends StatefulWidget {

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final ImagePicker picker = ImagePicker();

  XFile? photo;

  void openCamera() async {
     photo = await picker.pickImage(source: ImageSource.camera);
     setState((){});
  }
  void openGallery() async {
    photo = await picker.pickImage(source: ImageSource.gallery);
    setState((){});
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: photo == null,
              replacement: CircleAvatar(radius: 85, backgroundImage: Image.file(File(photo?.path??"")).image),
              child: CircleAvatar(
              radius: 85,
              backgroundColor: Colors.black,
              child: Icon(
                  Icons.person_rounded,
                  size: 170,
                  color: Colors.blue.shade900
              ),
              ),
            ),
            SizedBox(height: 27),
            AppButton(
              onPressed: () async {
                openCamera();
              },
                title: 'Upload From Camera'
            ),
            SizedBox(height: 12),
            AppButton(
              onPressed: () async {
                openGallery();
              },
                title: 'Upload From Gallery'
            ),
            SizedBox(height: 25),
            Divider(
              thickness: 1.2,
              endIndent: 20,
              indent: 20,
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
