import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management_app/constants/color_constants.dart';
import 'package:task_management_app/core/reusable_components/date_row.dart';
import 'package:task_management_app/constants/asset_constants.dart';

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
  final size = MediaQuery.of(context).size;
  final topPadding = MediaQuery.of(context).padding.top;

  return Container(
    height: MediaQuery.of(context).size.height * 0.25
,
    padding: EdgeInsets.fromLTRB(
      16,
      topPadding + size.height * 0.02,
      16,
      size.height * 0.015, // 🔹 reduced bottom padding
    ),
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
                        style: TextStyle(
                          color: ColorConstants.white,
                          fontSize: size.width * 0.06,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "👋",
                        style: TextStyle(
                          fontSize: size.width * 0.06,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.004), // 🔹 tighter
                  Text(
                    "Ready for today's Task?",
                    style: TextStyle(
                      color: ColorConstants.white.withOpacity(0.85),
                      fontSize: size.width * 0.035,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.notifications_none,
                color: ColorConstants.white),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: _showImagePickerDialog,
              child: CircleAvatar(
                radius: size.width * 0.045,
                backgroundColor: ColorConstants.white,
                backgroundImage: _profileImage != null
                    ? FileImage(_profileImage!)
                    : const AssetImage(AssetConstants.avatarImg)
                        as ImageProvider,
              ),
            ),
          ],
        ),

        /// 🔹 LESS but STANDARD spacing above chips
        SizedBox(height: size.height * 0.012),

        const DateRow(),
      ],
    ),
  );
}
}