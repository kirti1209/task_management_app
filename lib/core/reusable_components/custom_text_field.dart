import 'package:flutter/material.dart';
import '../../constants/color_constants.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String placeholder;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.placeholder,
    this.obscureText = false,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscured;

  @override
  void initState() {
    super.initState();
    _obscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            color: ColorConstants.fieldLabelColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: widget.controller,
            obscureText: _obscured,
            decoration: InputDecoration(
              hintText: widget.placeholder,
              hintStyle: const TextStyle(
                color: ColorConstants.gray,
                fontSize: 14,
              ),
              suffixIcon: widget.obscureText
                  ? IconButton(
                      icon: Icon(
                        _obscured ? Icons.visibility_off : Icons.visibility,
                        color: ColorConstants.gray,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscured = !_obscured;
                        });
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

