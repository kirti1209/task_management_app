import 'package:flutter/material.dart';
import 'package:task_management_app/constants/color_constants.dart';

class LabeledDropdown<T> extends StatelessWidget {
  final String label;
  final String hint;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;

  const LabeledDropdown({
    super.key,
    required this.label,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
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
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.inputBg,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonFormField<T>(
            value: value,
            decoration: const InputDecoration(border: InputBorder.none),
            hint: Text(hint, style: const TextStyle(color: ColorConstants.gray)),
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
            style: const TextStyle(color: ColorConstants.gray, fontSize: 14),
            items: items,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
