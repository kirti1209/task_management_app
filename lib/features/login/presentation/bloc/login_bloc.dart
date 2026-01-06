import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/login_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<CheckLoginStatus>(_onCheckLoginStatus);
  }

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final success = await loginRepository.login(
        event.username,
        event.password,
      );
      if (success) {
        emit(LoginSuccess());
      } else {
        emit(const LoginFailure(message: 'Invalid credentials'));
      }
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }

  Future<void> _onCheckLoginStatus(
    CheckLoginStatus event,
    Emitter<LoginState> emit,
  ) async {
    try {
      final isLoggedIn = await loginRepository.isLoggedIn();
      if (isLoggedIn) {
        emit(LoginSuccess());
      } else {
        emit(LoginInitial());
      }
    } catch (e) {
      emit(LoginInitial());
    }
  }
}

