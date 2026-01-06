import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management_app/constants/color_constants.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: StatCard(
            iconPath: "assets/all_task.svg",
            title: "All Tasks",
            value: "30",
            subtitle: "Total assigned this week",
            iconBgColor: ColorConstants.iconBgBlue,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: StatCard(
            iconPath: "assets/add_task.svg",
            title: "Create Task",
            value: "+",
            subtitle: "Add a new task quickly",
            iconBgColor: ColorConstants.iconBgRed,
          ),
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String value;
  final String subtitle;
  final Color iconBgColor;

  const StatCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.iconBgColor,
  });

  @override
  Widget build(BuildContext context) {
    final isCreateTask = title == "Create Task";
    
    return Container(
      height: 140, // Fixed height to ensure equal card sizes
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorConstants.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                width: isCreateTask ? 16 : 17,
                height: isCreateTask ? 18 : 21,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: ColorConstants.textBlack,
            ),
          ),
          if (!isCreateTask) ...[
            const SizedBox(height: 8),
            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: ColorConstants.textBlack,
              ),
            ),
          ] else
            const SizedBox(height: 8), // Spacer for Create Task to match height
          const SizedBox(height: 4),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: ColorConstants.textGrey,
            ),
          ),
        ],
      ),
    );
  }
}
