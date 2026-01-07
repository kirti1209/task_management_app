import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management_app/constants/color_constants.dart';
import 'package:task_management_app/constants/asset_constants.dart';

class NoteBox extends StatelessWidget {
  final String text;
  const NoteBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorConstants.noteBgBlueLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorConstants.noteBorderBlue),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AssetConstants.locationOutlineSvg,
            width: 20,
            height: 20,
            colorFilter: const ColorFilter.mode(ColorConstants.gray, BlendMode.srcIn),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 12, color: ColorConstants.noteTextMuted),
            ),
          ),
        ],
      ),
    );
  }
}
