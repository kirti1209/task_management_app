// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management_app/constants/color_constants.dart';
import 'package:task_management_app/constants/asset_constants.dart';

class StartPointButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const StartPointButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: ColorConstants.startPointBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetConstants.startButtonSvg,
                width: 16,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  ColorConstants.startPointText,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                "Start The Point",
                style: TextStyle(
                  color: ColorConstants.startPointText,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
