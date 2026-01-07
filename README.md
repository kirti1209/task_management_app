# Task Management App — Developer Guide

## Overview
- Feature-based, clean architecture with BLoC for state management.
- Reusable UI components and centralized constants for colors and assets.
- Mock API integration for All Task tabs (Assigned, Upcoming).
- App launcher icon configured and generated across platforms.

## Tech Stack
- Flutter SDK
- BLoC (`flutter_bloc`)
- `flutter_svg` for vector icons
- `shared_preferences` for simple local data

## Project Structure (key folders)
- `lib/constants/` — colors, assets, app strings
- `lib/core/` — DI container, reusable components shared across features
- `lib/features/all_tasks/` — All Task feature (presentation, domain, data)
- `lib/features/create_task/` — Create Task feature (presentation/widgets)
- `lib/features/home/` — Home feature and header
- `lib/main.dart` — routes and app bootstrap

## Constants
- Colors: `lib/constants/color_constants.dart`
  - Page/sections: `white`, `pageBgDimWhite`
  - Text: `gray #717182`, `fieldLabelColor #310A12`
  - Buttons: `disabledButtonGray #AAAAAA`, `allTaskButtonYellow #F5B400`
  - Chips: `pendingChipBg #FFF1CC`, `pendingChipText #F5B400`
  - Inputs: `inputBg #F3F3F5`
  - Note box: `noteBorderBlue #5DA4FF`, `noteTextMuted #838592`, `noteBgBlueLight #EFF6FF`
  - Gradients: `primaryGradient` (top→bottom: `gradientStart #FFA34C` → `gradientEnd #FF4D30`)

- Assets: `lib/constants/asset_constants.dart`
  - `addTaskSvg`, `allTaskSvg`, `startButtonSvg`, `playSvg`
  - `locationOutlineSvg`, `avatarImg`, `appIconPng`

## Reusable Components
- `lib/core/reusable_components/stats_card.dart`
  - Two cards on Home: All Tasks and Create Task
  - Centered icon, title, dynamic value section (All Tasks), 2-line subtitle for Create Task
- `lib/features/all_tasks/presentation/widgets/all_task_item_card.dart`
  - Props: `title`, `description`, `dueText`, `location`, `onAddLog`
  - Flags: `isPending`, `isUpcoming`, `statusLabel`, `showActionButton`
  - Behaviors:
    - Shows right-aligned status chip for Pending/Upcoming
    - Uses red calendar icon and text for "Issued at" style
    - Hides action button on Upcoming; shows yellow button on others with `playSvg`
- `lib/features/create_task/presentation/widgets/labeled_text_field.dart`
  - Label with `fieldLabelColor`; input styled with `inputBg` and text `gray`
- `lib/features/create_task/presentation/widgets/labeled_dropdown.dart`
  - Styled like input; black dropdown icon; text `gray`
- `lib/features/create_task/presentation/widgets/note_box.dart`
  - Location SVG and note text; bordered light-blue box per spec
- `lib/core/reusable_components/startpointButton.dart`
  - Full-width rounded button with start SVG and text color synced

## Features
- All Task Screen: `lib/features/all_tasks/presentation/screens/all_tasks_screen.dart`
  - Tabs: Assigned, Pending, Upcoming (DefaultTabController)
  - Assigned: BLoC-powered list from mock repo
  - Pending: Static rendering using `AllTaskItemCard` with `isPending`
  - Upcoming: BLoC-powered list, `isUpcoming`, chip visible, action button hidden

## BLoC Integration (Assigned & Upcoming)
- Domain
  - `lib/features/all_tasks/domain/entities/task_item.dart`
  - `lib/features/all_tasks/domain/repositories/all_tasks_repository.dart`
- Data
  - `lib/features/all_tasks/data/datasources/all_tasks_remote_data_source.dart` (Mock)
  - `lib/features/all_tasks/data/repositories/all_tasks_repository_impl.dart`
- Presentation — Assigned
  - `assigned_tasks_event.dart`: `LoadAssignedTasks`, `RefreshAssignedTasks`
  - `assigned_tasks_state.dart`: `Initial`, `Loading`, `Loaded`, `Empty`, `Error`
  - `assigned_tasks_bloc.dart`: orchestrates loading
- Presentation — Upcoming
  - `upcoming_tasks_event.dart`: `LoadUpcomingTasks`, `RefreshUpcomingTasks`
  - `upcoming_tasks_state.dart`: `Initial`, `Loading`, `Loaded`, `Empty`, `Error`
  - `upcoming_tasks_bloc.dart`: orchestrates loading
- DI
  - `lib/core/di/injection_container.dart`: wires remote → repo → blocs; provides `getAssignedTasksBloc()` and `getUpcomingTasksBloc()`

## Mock API Data
- Assigned tasks: three items with varying `metaText` (e.g., "Due by 5:00 PM")
- Upcoming tasks: list of items with `metaText` like "Issued at 22 Oct", matching UI spec

## Create Task Screen
- `lib/features/create_task/presentation/screens/create_task_screen.dart`
  - Page background `white` per spec
  - Fields:
    - Task Title — required
    - Select Patsanstha — required (dropdown)
    - Task Description — multiline
    - Amount (Optional) — numeric
  - Note Box: location capture message with `locationOutlineSvg`
  - Submit button:
    - Disabled by default `disabledButtonGray`
    - Valid form uses `primaryGradient`

## Navigation Routes
- `lib/main.dart`
  - `/home` → `HomeScreen`
  - `/all_tasks` → `AllTasksScreen`
  - `/create_task` → `CreateTaskScreen`
- Home wiring
  - `StatsSection` navigates to All Task and Create Task on tap

## App Icon
- Source asset: `assets/task_App_icon.png`
- Config: `pubspec.yaml` — `flutter_launcher_icons`
- Generate:
  - `flutter pub get`
  - `flutter pub run flutter_launcher_icons`
- Platforms: Android, iOS, Web, Windows, macOS, Linux

## Development Commands
- Install deps: `flutter pub get`
- Run app: `flutter run`
- Generate app icons: `flutter pub run flutter_launcher_icons`

## Approach: Reusable, Clean, Understandable
- Centralized constants ensure consistent styling and easy updates.
- Stateless, prop-driven widgets provide flexibility and keep UIs predictable.
- BLoC separates UI from business logic, with explicit events/states for reliability.
- Mock data sources unblock UI work and facilitate testing integrations.
- Feature folders encapsulate presentation/domain/data for maintainability.

## Future Enhancements
- Replace mock with real API services and error handling integration.
- Add unit/widget tests for blocs and widgets.
- Extend BLoC to Pending and Assigned actions (logging, status transitions).

