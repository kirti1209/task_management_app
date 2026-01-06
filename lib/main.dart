import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/features/home/presentation/screens/home_screen.dart';
import 'core/di/injection_container.dart';
import 'features/login/presentation/bloc/login_event.dart';
import 'features/login/presentation/screens/login_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agent Task Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => DependencyContainer.instance!.getLoginBloc()
          ..add(const CheckLoginStatus()),
        child: const LoginScreen(),
      ),
      routes: {
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
