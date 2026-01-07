import 'package:flutter/material.dart';
import 'package:task_management_app/constants/color_constants.dart';
import 'package:task_management_app/core/reusable_components/task_card.dart';

class YesterdayPendingSection extends StatelessWidget {
  const YesterdayPendingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                const Text(
                  "Yesterday’s",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF310A12),
                  ),
                ),
                Positioned(
                  bottom: -5,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 6,
                    decoration: BoxDecoration(
                      gradient: ColorConstants.primaryGradient,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 6),
            const Text(
              "Pending Tasks",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF310A12),
              ),
            ),
          ],
        ),

        const SizedBox(height: 26),

        /// Task Cards
        const TaskCard(
          title: "Deliver reports to Client A",
          dueDate: "21 Jul",
          assignedBy: "Manager",
        ),
        const SizedBox(height: 16),
        const TaskCard(
          title: "Follow up with the design team",
          dueDate: "21 Jul",
          assignedBy: "Team Lead",
        ),
      ],
    );
  }
}
