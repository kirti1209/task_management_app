import 'package:flutter/material.dart';
import 'package:task_management_app/constants/color_constants.dart';
import 'package:task_management_app/core/reusable_components/home_header.dart';
import 'package:task_management_app/core/reusable_components/stats_card.dart';
import 'package:task_management_app/core/reusable_components/startpointButton.dart';
import 'package:task_management_app/core/reusable_components/bottom_navigation.dart';
import 'package:task_management_app/features/home/presentation/widget/yesterday_pending_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.pageBgDimWhite,
      body: const SafeArea(
        child: Column(
          children: [
            HomeHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StatsSection(),
                    SizedBox(height: 20),
                    StartPointButton(),
                    SizedBox(height: 24),
                    // const SizedBox(height: 24),
YesterdayPendingSection(),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

