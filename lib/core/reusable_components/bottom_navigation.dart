import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/color_constants.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorConstants.orange,
        unselectedItemColor: ColorConstants.gray,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        items: [
          _buildNavItem(0, "assets/home.svg", "Home"),
          _buildNavItem(1, "assets/bottom_nav_2.svg", ""),
          _buildNavItem(2, "assets/bottom_nav_3.svg", ""),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      int index, String assetPath, String label) {
    final isSelected = currentIndex == index;
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: isSelected ? ColorConstants.primaryGradient : null,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          assetPath,
          width: isSelected ? 22 : 18,
          height: isSelected ? 22 : 18,
          colorFilter: ColorFilter.mode(
            isSelected ? ColorConstants.white : ColorConstants.gray,
            BlendMode.srcIn,
          ),
        ),
      ),
      label: label,
    );
  }
}

