import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/constants/color_constants.dart';
import 'package:task_management_app/core/reusable_components/task_card.dart';
import 'package:task_management_app/core/di/injection_container.dart';
import '../../presentation/bloc/yesterday_pending_bloc.dart';
import '../../presentation/bloc/yesterday_pending_event.dart';
import '../../presentation/bloc/yesterday_pending_state.dart';

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
        BlocProvider(
          create: (_) => DependencyContainer.instance!
              .getYesterdayPendingBloc()
            ..add(const LoadYesterdayPendingTasks()),
          child: BlocBuilder<YesterdayPendingBloc, YesterdayPendingState>(
            builder: (context, state) {
              if (state is YesterdayPendingLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is YesterdayPendingError) {
                return Column(
                  children: [
                    Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => context
                          .read<YesterdayPendingBloc>()
                          .add(const RefreshYesterdayPendingTasks()),
                      child: const Text('Retry'),
                    ),
                  ],
                );
              }
              if (state is YesterdayPendingEmpty) {
                return const Text(
                  'No pending tasks from yesterday',
                  style: TextStyle(color: ColorConstants.gray),
                );
              }
              if (state is YesterdayPendingLoaded) {
                return Column(
                  children: [
                    for (int i = 0; i < state.tasks.length; i++) ...[
                      TaskCard(
                        title: state.tasks[i].title,
                        dueDate: state.tasks[i].dueDate,
                        assignedBy: state.tasks[i].assignedBy,
                      ),
                      if (i != state.tasks.length - 1)
                        const SizedBox(height: 16),
                    ],
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
