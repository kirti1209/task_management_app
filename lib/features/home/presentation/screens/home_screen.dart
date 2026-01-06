import 'package:flutter/material.dart';
import 'package:task_management_app/constants/color_constants.dart';
import 'package:task_management_app/core/reusable_components/home_header.dart';
import 'package:task_management_app/core/reusable_components/stats_card.dart';
import 'package:task_management_app/core/reusable_components/startpointButton.dart';
import 'package:task_management_app/core/reusable_components/task_card.dart';
import 'package:task_management_app/core/reusable_components/bottom_navigation.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StatsSection(),
                    const SizedBox(height: 20),
                    const StartPointButton(),
                    const SizedBox(height: 24),
                    // Yesterday's Pending Tasks Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Stack(
                              children: [
                                const Text(
                                  "Yesterday's",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF310A12),
                                  ),
                                ),
                                Positioned(
                                  bottom: -2,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 3,
                                    decoration: BoxDecoration(
                                      color: ColorConstants.orange,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              "Pending Tasks",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF310A12),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const TaskCard(
                          title: "Deliver reports to Client A",
                          dueDate: "21 Jul",
                          assignedBy: "Manager",
                        ),
                        const TaskCard(
                          title: "Follow up with the design team",
                          dueDate: "21 Jul",
                          assignedBy: "Team Lead",
                        ),
                      ],
                    ),
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

