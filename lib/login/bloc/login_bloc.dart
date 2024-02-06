/*
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_custom_widget/Home/onboarding/login/repositories/login_repository.dart';

import '../../repositories/auth_repository.dart';
import '../Exception/login_exception.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository})
      : super(LoginState(status: LoginStatus.initial)) {
    on<LoginEmailChanged>(_onLoginEmailChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<LoginForgotPasswordChanged>(_onLoginForgotPasswordChanged);
    on<SignInSubmitted>(_onSignIn);
  }

  void _onLoginEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onLoginPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onLoginForgotPasswordChanged(
      LoginForgotPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(status: LoginStatus.forgotPassword));
  }

  void _onSignIn(
    SignInSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      var email = state.email.toString();
      var password = state.password.toString();

      final user = loginRepository.signIn(email, password);
      if (user != null) {
        emit(state.copyWith(
            status: LoginStatus.loaded, email: email, password: password));
        print('signin');
      }
    } on LogInWithEmailAndPasswordFailure {
      emit(state.copyWith(status: LoginStatus.error));
    }
  }
}
*/
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_new_app/repository/auth_repository.dart';

import 'login_state.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const LoginState()) {
    on<LoginButtonPressedEvent>(_handleLoginWithEmailAndPasswordEvent);
    on<LoginEmailChangedEvent>(_handleLoginEmailChangedEvent);
    on<LoginPasswordChangedEvent>(_handleLoginPasswordChangedEvent);
  }

  final AuthRepository _authRepository;

  Future<void> _handleLoginEmailChangedEvent(
      LoginEmailChangedEvent event,
      Emitter<LoginState> emit,
      ) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _handleLoginPasswordChangedEvent(
      LoginPasswordChangedEvent event,
      Emitter<LoginState> emit,
      ) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _handleLoginWithEmailAndPasswordEvent(
      LoginButtonPressedEvent event,
      Emitter<LoginState> emit,
      ) async {
    try {
      await _authRepository.loginWithEmailandPassword(
          email: state.email, password: state.password);

      emit(state.copyWith(message: 'Success', status: LoginStatus.success));
    } catch (e) {
      emit(state.copyWith(message: e.toString(), status: LoginStatus.failure));
    }
  }
}
