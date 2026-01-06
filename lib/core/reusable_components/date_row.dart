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

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(dates.length, (index) {
        return DateChip(
          day: dates[index].$1,
          date: dates[index].$2,
          month: dates[index].$3,
          isActive: index == selectedIndex,
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
        );
      }),
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

  Widget _buildGradientText(String text, double fontSize, FontWeight fontWeight) {
    if (isActive) {
      return ShaderMask(
        shaderCallback: (bounds) => ColorConstants.primaryGradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: ColorConstants.white,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isActive ? 81 : 63,
        height: isActive ? 102 : 84,
        decoration: BoxDecoration(
          color: isActive
              ? ColorConstants.dateActive // #FFFFFFD9 - 85% opacity
              : ColorConstants.dateInactive, // #FFFFFF33 - 20% opacity
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildGradientText(
              day,
              11,
              FontWeight.w500,
            ),
            const SizedBox(height: 4),
            _buildGradientText(
              date,
              18,
              FontWeight.w700,
            ),
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
