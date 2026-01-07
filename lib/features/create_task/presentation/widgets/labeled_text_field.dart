import 'package:flutter/material.dart';
import 'package:task_management_app/constants/color_constants.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final int maxLines;
  final TextInputType keyboardType;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.controller,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: ColorConstants.fieldLabelColor,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: const TextStyle(
            color: ColorConstants.gray,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(
              color: ColorConstants.gray,
              fontSize: 14,
            ),
            filled: true,
            fillColor: ColorConstants.inputBg,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
