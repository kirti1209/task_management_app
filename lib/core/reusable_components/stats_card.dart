import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management_app/constants/color_constants.dart';
import 'package:task_management_app/constants/asset_constants.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, '/all_tasks'),
            borderRadius: BorderRadius.circular(12),
            child: const StatCard(
              iconPath: AssetConstants.allTaskSvg,
              title: "All Tasks",
              value: "30",
              subtitle: "Total assigned this week",
              iconBgColor: ColorConstants.iconBgBlue,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, '/create_task'),
            borderRadius: BorderRadius.circular(12),
            child: const StatCard(
              iconPath: AssetConstants.addTaskSvg,
              title: "Create Task",
              value: "",
              subtitle: "Add a new task quickly",
              iconBgColor: ColorConstants.iconBgRed,
            ),
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
    final bool isCreateTask = title == "Create Task";

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: ColorConstants.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Icon with plus badge for Create Task
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    iconPath,
                    width: 22,
                    height: 22,
                  ),
                ),
              ),
              
            ],
          ),

          const SizedBox(height: 14),

          /// Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF1A1A1A),
            ),
          ),

          const SizedBox(height: 6),

          /// Value (only for All Tasks)
          if (!isCreateTask) ...[
            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1A1A),
                height: 1.2,
              ),
            ),
            const SizedBox(height: 6),
          ] else
            const SizedBox(height: 0),

          /// Subtitle
          if (isCreateTask) ...[
            const Text(
              'Add a new task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF666666),
                height: 1.3,
              ),
            ),
            const Text(
              'quickly',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF666666),
                height: 1.3,
              ),
            ),
            const SizedBox(height: 48),
          ] else ...[
            Text(
              subtitle,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF666666),
                height: 1.3,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
