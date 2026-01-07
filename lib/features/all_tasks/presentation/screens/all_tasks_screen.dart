import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/constants/color_constants.dart';
import 'package:task_management_app/features/all_tasks/presentation/widgets/all_task_item_card.dart';
import 'package:task_management_app/core/di/injection_container.dart';
import '../bloc/assigned/assigned_tasks_bloc.dart';
import '../bloc/assigned/assigned_tasks_event.dart';
import '../bloc/assigned/assigned_tasks_state.dart';
import '../bloc/upcoming/upcoming_tasks_bloc.dart';
import '../bloc/upcoming/upcoming_tasks_event.dart';
import '../bloc/upcoming/upcoming_tasks_state.dart';

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: ColorConstants.pageBgDimWhite,
        appBar: AppBar(
          title: const Text(
            'All Task',
            style: TextStyle(
              color: Color(0xFF310A12),
              fontWeight: FontWeight.w600,
            ),
          ),
          surfaceTintColor: Colors.transparent,
          backgroundColor: ColorConstants.white,
          foregroundColor: ColorConstants.gray,
          elevation: 1,
          bottom: const TabBar(
            labelColor: ColorConstants.fieldLabelColor,
            unselectedLabelColor: ColorConstants.gray,
            indicatorColor: Color(0xFFFF4D30),
            indicatorWeight: 3,
            tabs: [
              Tab(text: 'Assigned'),
              Tab(text: 'Pending'),
              Tab(text: 'Upcoming'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _AssignedList(),
            _PendingList(),
            _UpcomingList(),
          ],
        ),
      ),
    );
  }
}

class _AssignedList extends StatelessWidget {
  const _AssignedList();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DependencyContainer.instance!.getAssignedTasksBloc()
        ..add(const LoadAssignedTasks()),
      child: BlocBuilder<AssignedTasksBloc, AssignedTasksState>(
        builder: (context, state) {
          if (state is AssignedLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is AssignedError) {
            return Column(
              children: [
                Text(state.message, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => context
                      .read<AssignedTasksBloc>()
                      .add(const RefreshAssignedTasks()),
                  child: const Text('Retry'),
                ),
              ],
            );
          }
          if (state is AssignedEmpty) {
            return const Center(
              child: Text(
                'No assigned tasks',
                style: TextStyle(color: ColorConstants.gray),
              ),
            );
          }
          if (state is AssignedLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final t = state.tasks[index];
                return AllTaskItemCard(
                  title: t.title,
                  description: t.description,
                  dueText: t.metaText,
                  location: t.location,
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 12),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _PendingList extends StatelessWidget {
  const _PendingList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 6,
      itemBuilder: (context, index) {
        return const AllTaskItemCard(
          title: 'Shri Swami Samarth Patsanstha',
          description: 'Monthly documentation and fund verification',
          dueText: 'Issued at 22 Oct',
          location: 'Pune, Maharashtra',
          isPending: true,
          statusLabel: 'Pending',
        );
      },
    );
  }
}

class _UpcomingList extends StatelessWidget {
  const _UpcomingList();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DependencyContainer.instance!.getUpcomingTasksBloc()
        ..add(const LoadUpcomingTasks()),
      child: BlocBuilder<UpcomingTasksBloc, UpcomingTasksState>(
        builder: (context, state) {
          if (state is UpcomingLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UpcomingError) {
            return Column(
              children: [
                Text(state.message, style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => context
                      .read<UpcomingTasksBloc>()
                      .add(const RefreshUpcomingTasks()),
                  child: const Text('Retry'),
                ),
              ],
            );
          }
          if (state is UpcomingEmpty) {
            return const Center(
              child: Text(
                'No upcoming tasks',
                style: TextStyle(color: ColorConstants.gray),
              ),
            );
          }
          if (state is UpcomingLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final t = state.tasks[index];
                return AllTaskItemCard(
                  title: t.title,
                  description: t.description,
                  dueText: t.metaText,
                  location: t.location,
                  isUpcoming: true,
                  statusLabel: 'Upcoming',
                  showActionButton: false,
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 12),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
