import 'package:flutter/material.dart';
import 'package:task_management_app/constants/color_constants.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String dueDate;
  final String assignedBy;

  const TaskCard({
    super.key,
    required this.title,
    required this.dueDate,
    required this.assignedBy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorConstants.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Color(0xFF310A12),
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF717182),
                    ),
                    children: [
                      TextSpan(text: "Due $dueDate - Status: "),
                      TextSpan(
                        text: "Pending",
                        style: TextStyle(
                          color: ColorConstants.orange,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Assigned by: $assignedBy",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF717182),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: ColorConstants.orange,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "Add to Task Log",
              style: TextStyle(
                color: ColorConstants.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
