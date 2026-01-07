import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management_app/constants/color_constants.dart';
import 'package:task_management_app/core/reusable_components/date_row.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String username = 'User';
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    _loadUsername();
    _loadProfileImage();
  }

  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? 'User';
    });
  }

  Future<void> _loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString('profile_image');
    if (path != null && mounted) {
      setState(() {
        _profileImage = File(path);
      });
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: source, imageQuality: 70);

    if (picked != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_image', picked.path);

      setState(() {
        _profileImage = File(picked.path);
      });
    }
  }

  void _showImagePickerDialog() {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: const Text('Change Profile Photo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Camera'),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Gallery'),
            onTap: () {
              Navigator.pop(context);
              _pickImage(ImageSource.gallery);
            },
          ),
        ],
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 36, 16, 20),
        decoration: const BoxDecoration(
          gradient: ColorConstants.primaryGradient,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(28),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Hello, $username",
                            style: const TextStyle(
                              color: ColorConstants.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Text("👋", style: TextStyle(fontSize: 24)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Ready for today's Task?",
                        style: TextStyle(
                          color: ColorConstants.white.withOpacity(0.85),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.notifications_none,
                    color: ColorConstants.white),
                const SizedBox(width: 12),

                /// 🔹 Profile Avatar
                GestureDetector(
                 onTap: _showImagePickerDialog,

                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: ColorConstants.white,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : const AssetImage('assets/avatar_img.jpg')
                            as ImageProvider,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            const DateRow(),
          ],
        ),
      ),
    );
  }
}
