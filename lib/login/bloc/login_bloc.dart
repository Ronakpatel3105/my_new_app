


import 'package:bloc/bloc.dart';

import '../../repository/auth_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const LoginState()) {
    on<LoginButtonPressedEvent>(_onSignIn);
    on<LoginEmailChangedEvent>(_onLoginEmailChanged);
    on<LoginPasswordChangedEvent>(_onLoginPasswordChanged);
  }

  final AuthRepository _authRepository;

  void _onLoginEmailChanged(LoginEmailChangedEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onLoginPasswordChanged(
      LoginPasswordChangedEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  /*void _onLoginForgotPasswordChanged(
      LoginForgotPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(status: LoginStatus.forgotPassword));
  }*/

  void _onSignIn(
      LoginButtonPressedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      var email = state.email.toString();
      var password = state.password.toString();

      final user = _authRepository.loginWithEmailAndPassword(email: email, password: password);
      if (user != null) {
        emit(state.copyWith(
            status: LoginStatus.success, email: email, password: password));
        print('signin');
      }
    } catch(e) {
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }
}

/*import 'package:bloc/bloc.dart';
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
}*/




/*class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginState.initial());

  void emailChanged(String value) {
    emit(
      state.copyWith(
        email: value,
        status: LoginStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(
        password: value,
        status: LoginStatus.initial,
      ),
    );
  }

  Future<void> logInWithCredentials() async {
    if (state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      await _authRepository.loginWithEmailandPassword(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(status: LoginStatus.success));
    } catch (_) {}
  }
}*/

