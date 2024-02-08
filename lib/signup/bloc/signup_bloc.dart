
/*
import 'package:bloc/bloc.dart';
import 'package:my_new_app/repository/auth_repository.dart';
import 'package:my_new_app/signup/bloc/signup_event.dart';
import 'package:my_new_app/signup/bloc/signup_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const RegisterState()) {
    on<RegisterButtonPressedEvent>(_handleRegisterWithEmailAndPasswordEvent);
    on<RegisterEmailChangedEvent>(_handleRegisterEmailChangedEvent);
    on<RegisterPasswordChangedEvent>(_handleRegisterPasswordChangedEvent);
  }

  final AuthRepository _authRepository;

  Future<void> _handleRegisterEmailChangedEvent(
    RegisterEmailChangedEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _handleRegisterPasswordChangedEvent(
    RegisterPasswordChangedEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _handleRegisterWithEmailAndPasswordEvent(
    RegisterButtonPressedEvent event,
    Emitter<RegisterState> emit,
  ) async {
    try {
      await _authRepository.signUp(
          email: state.email, password: state.password);

      emit(state.copyWith(message: 'Success', status: RegisterStatus.success));
    } catch (e) {
      emit(state.copyWith(
          message: e.toString(), status: RegisterStatus.failure));
    }
  }
}

 */

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_new_app/signup/bloc/signup_state.dart';

import '../../repository/auth_repository.dart';



class SignupCubit extends Cubit<SignupState> {
  final AuthRepository _authRepository;

  SignupCubit(this._authRepository) : super(SignupState.initial());

  void emailChanged(String value) {
    emit(
      state.copyWith(
        email: value,
        status: SignupStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(
        password: value,
        status: SignupStatus.initial,
      ),
    );
  }

  Future<void> signupFormSubmitted() async {
    if (state.status == SignupStatus.submitting) return;
    emit(state.copyWith(status: SignupStatus.submitting));
    try {
      await _authRepository.signUp(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(status: SignupStatus.success));
    } catch (_) {}
  }
}