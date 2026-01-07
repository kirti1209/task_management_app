import 'package:flutter/material.dart';
import 'package:task_management_app/constants/color_constants.dart';

class DateRow extends StatefulWidget {
  const DateRow({super.key});

  @override
  State<DateRow> createState() => _DateRowState();
}

class _DateRowState extends State<DateRow> {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    final dates = [
      ("Sat", "19", "Oct"),
      ("Sun", "20", "Oct"),
      ("Mon", "21", "Oct"),
      ("Tue", "22", "Oct"),
      ("Wed", "23", "Oct"),
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(dates.length, (index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index == dates.length - 1 ? 0 : 12,
            ),
            child: DateChip(
              day: dates[index].$1,
              date: dates[index].$2,
              month: dates[index].$3,
              isActive: index == selectedIndex,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          );
        }),
      ),
    );
  }
}

class DateChip extends StatelessWidget {
  final String day;
  final String date;
  final String month;
  final bool isActive;
  final VoidCallback? onTap;

  const DateChip({
    super.key,
    required this.day,
    required this.date,
    required this.month,
    this.isActive = false,
    this.onTap,
  });

  Widget _gradientText(
    String text,
    double fontSize,
    FontWeight weight,
  ) {
    return isActive
        ? ShaderMask(
            shaderCallback: (bounds) =>
                ColorConstants.primaryGradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: weight,
                color: Colors.white,
              ),
            ),
          )
        : Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: weight,
              color: ColorConstants.white,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    /// Base responsive size
    final baseWidth = screenWidth * 0.17;
    final baseHeight = baseWidth * 1.35;

    /// Slight scale for active (NOT pixel based)
    final scale = isActive ? 1.12 : 1.0;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        width: baseWidth * scale,
        height: baseHeight * scale,
        decoration: BoxDecoration(
          color: isActive
              ? ColorConstants.dateActive
              : ColorConstants.dateInactive,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _gradientText(day, 11, FontWeight.w500),
            const SizedBox(height: 4),
            _gradientText(date, 18, FontWeight.w700),
            const SizedBox(height: 2),
            isActive
                ? ShaderMask(
                    shaderCallback: (bounds) =>
                        ColorConstants.primaryGradient.createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                    child: Text(
                      month,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  )
                : Text(
                    month,
                    style: TextStyle(
                      fontSize: 10,
                      color: ColorConstants.white.withOpacity(0.85),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
