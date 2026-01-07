import 'package:flutter/material.dart';
import 'package:task_management_app/constants/color_constants.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String dueDate;
  final String assignedBy;
  final VoidCallback? onTap;

  const TaskCard({
    super.key,
    required this.title,
    required this.dueDate,
    required this.assignedBy,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorConstants.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
              height: 1.3,
            ),
          ),
          
          const SizedBox(height: 10),

          /// DUE DATE & STATUS
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF666666),
                height: 1.4,
              ),
              children: [
                TextSpan(text: "Due $dueDate - Status: "),
                const TextSpan(
                  text: "Pending",
                  style: TextStyle(
                    color: ColorConstants.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 4),

          /// ASSIGNED BY
          Text(
            "Assigned by: $assignedBy",
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF666666),
              height: 1.4,
            ),
          ),

          const SizedBox(height: 16),

          /// BUTTON (ALIGNED TO RIGHT)
          Align(
  alignment: Alignment.centerRight,
  child: GestureDetector(
    onTap: onTap,
    child: Container(
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        gradient: ColorConstants.primaryGradient,
        borderRadius: BorderRadius.circular(12), // More rounded, pill-shaped
        boxShadow: [
          BoxShadow(
            color: ColorConstants.orange.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Text(
        "Add to Task Log",
        style: TextStyle(
          color: ColorConstants.white,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),
    ),
  ),
),
        ],
      ),
    );
  }
}