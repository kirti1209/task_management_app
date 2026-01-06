import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/app_constants.dart';
import '../../../../core/reusable_components/custom_text_field.dart';
import '../../../../core/reusable_components/custom_button.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    context.read<LoginBloc>().add(
          LoginButtonPressed(
            username: _usernameController.text.trim(),
            password: _passwordController.text.trim(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: ColorConstants.primaryGradient,
        ),
        child: SafeArea(
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Navigator.of(context).pushReplacementNamed('/home');
              } else if (state is LoginFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: ColorConstants.red,
                  ),
                );
              }
            },
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              color: ColorConstants.cardColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Logo placeholder
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: ColorConstants.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                // App Name
                                const Text(
                                  AppConstants.appName,
                                  style: TextStyle(
                                    color: ColorConstants.red,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                // Login to continue
                                const Text(
                                  AppConstants.loginText,
                                  style: TextStyle(
                                    color: ColorConstants.gray,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 32),
                                // User Name Field
                                CustomTextField(
                                  label: AppConstants.userNameLabel,
                                  placeholder: AppConstants.userNameLabel,
                                  controller: _usernameController,
                                ),
                                const SizedBox(height: 24),
                                // Password Field
                                CustomTextField(
                                  label: AppConstants.passwordLabel,
                                  placeholder: AppConstants.passwordLabel,
                                  obscureText: true,
                                  controller: _passwordController,
                                ),
                                const SizedBox(height: 32),
                                // Login Button
                                BlocBuilder<LoginBloc, LoginState>(
                                  builder: (context, state) {
                                    return CustomButton(
                                      text: AppConstants.loginButton,
                                      onPressed: state is LoginLoading
                                          ? () {}
                                          : _handleLogin,
                                    );
                                  },
                                ),
                                const SizedBox(height: 24),
                                // Powered by Admin
                                const Text(
                                  AppConstants.poweredBy,
                                  style: TextStyle(
                                    color: ColorConstants.gray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Version text exactly below the box
                          const SizedBox(height: 16),
                          const Text(
                            AppConstants.version,
                            style: TextStyle(
                              color: ColorConstants.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

