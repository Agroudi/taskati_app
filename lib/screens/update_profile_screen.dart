import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskati_app/widgets/app_user.dart';

class UploadProfileScreen extends StatefulWidget {
  const UploadProfileScreen({super.key});

  @override
  State<UploadProfileScreen> createState() => _UploadProfileScreenState();
}

class _UploadProfileScreenState extends State<UploadProfileScreen> {

  final TextEditingController nameController = TextEditingController();
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    nameController.text = AppUser.name;
  }

  Future<void> pickFromCamera() async {
    final XFile? file = await picker.pickImage(source: ImageSource.camera);

    if (file == null) return;

    await _saveUserPhoto(file.path);
  }

  Future<void> pickFromGallery() async {
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);

    if (file == null) return;

    await _saveUserPhoto(file.path);
  }

  Future<void> _saveUserPhoto(String path) async {
    AppUser.imagePath = path;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("user_photo", path);

    setState(() {});
    if (mounted) Navigator.pop(context);
  }

  Future<void> updateName() async {
    final newName = nameController.text.trim();

    if (newName.isEmpty) return;

    AppUser.name = newName;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("user_name", newName);

    setState(() {});
    if (mounted) Navigator.pop(context);
  }

  void showPhotoSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              ElevatedButton(
                onPressed: pickFromCamera,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    minimumSize: Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(13))
                ),
                child: const Text(
                    "Upload From Camera",
                    style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        color: Colors.white,
                        fontSize: 17
                    )
                ),
              ),

              const SizedBox(height: 12),

              ElevatedButton(
                onPressed: pickFromGallery,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    minimumSize: Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(13))
                ),
                child: const Text(
                    "Upload From Gallery",
                    style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        color: Colors.white,
                        fontSize: 17
                    )
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showNameSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Your Name",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: updateName,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade900,
                      minimumSize: Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(13))
                  ),
                child: const Text(
                    "Update Your Name",
                    style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        color: Colors.white,
                        fontSize: 17
                    )
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: showPhotoSheet,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AppUser.image,
                    child: AppUser.image == null
                        ? const Icon(Icons.person, size: 60)
                        : null,
                  ),
                  const Icon(
                    Icons.camera_alt,
                    color: Color(0xFF0D47A1),
                    size: 25,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Divider(color: Color(0xFF0D47A1), thickness: 1.2),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Text(
                    AppUser.name,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xFF0D47A1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Container(
                  child: IconButton(
                  onPressed: showNameSheet,
                    icon: const Icon(Icons.mode_edit_outline_outlined, color: Color(0xFF0D47A1)),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF0D47A1)),
                    borderRadius: BorderRadius.circular(40),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}