import 'package:flutter/material.dart';
import 'package:task_management_app/constants/color_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management_app/constants/asset_constants.dart';

class AllTaskItemCard extends StatelessWidget {
  final String title;
  final String description;
  final String dueText;
  final String location;
  final VoidCallback? onAddLog;
  final bool isPending;
  final String? statusLabel;
  final bool isUpcoming;
  final bool showActionButton;

  const AllTaskItemCard({
    super.key,
    required this.title,
    required this.description,
    required this.dueText,
    required this.location,
    this.onAddLog,
    this.isPending = false,
    this.statusLabel,
    this.isUpcoming = false,
    this.showActionButton = true,
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
            color: Colors.black.withOpacity(0.06),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Color(0xFF310A12),
                  ),
                ),
              ),
              if (isPending || isUpcoming)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: ColorConstants.pendingChipBg,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    statusLabel ?? (isUpcoming ? 'Upcoming' : 'Pending'),
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: ColorConstants.pendingChipText,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF717182),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon((isPending || isUpcoming) ? Icons.event : Icons.schedule,
                  size: 16,
                  color: (isPending || isUpcoming)
                      ? ColorConstants.red
                      : ColorConstants.gray),
              const SizedBox(width: 6),
              Text(
                dueText,
                style: TextStyle(
                  fontSize: 12,
                  color: (isPending || isUpcoming)
                      ? ColorConstants.red
                      : ColorConstants.gray,
                ),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.place, size: 16, color: ColorConstants.gray),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  location,
                  style: const TextStyle(fontSize: 12, color: ColorConstants.gray),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          if (showActionButton && !isUpcoming) ...[
            const SizedBox(height: 12),
            GestureDetector(
              onTap: onAddLog,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: ColorConstants.allTaskButtonYellow,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetConstants.playSvg,
                      width: 18,
                      height: 18,
                      colorFilter: const ColorFilter.mode(
                        ColorConstants.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Add to task log',
                      style: TextStyle(
                        color: ColorConstants.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
