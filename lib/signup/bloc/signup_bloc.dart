

import 'package:bloc/bloc.dart';
import 'package:my_new_app/repository/auth_repository.dart';
import 'package:my_new_app/signup/bloc/signup_event.dart';
import 'package:my_new_app/signup/bloc/signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const SignupState()) {
    on<SignupButtonPressedEvent>(_handleRegisterWithEmailAndPasswordEvent);
    on<SignupEmailChangedEvent>(_handleRegisterEmailChangedEvent);
    on<SignupPasswordChangedEvent>(_handleRegisterPasswordChangedEvent);
  }

  final AuthRepository _authRepository;

  Future<void> _handleRegisterEmailChangedEvent(
      SignupEmailChangedEvent event,
    Emitter<SignupState> emit,
  ) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _handleRegisterPasswordChangedEvent(
      SignupPasswordChangedEvent event,
    Emitter<SignupState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _handleRegisterWithEmailAndPasswordEvent(
      SignupButtonPressedEvent event,
    Emitter<SignupState> emit,
  ) async {
    try {
      await _authRepository.signUp(
          email: state.email, password: state.password);

      emit(state.copyWith(message: 'Success', status: SignupStatus.success));
    } catch (e) {
      emit(state.copyWith(
          message: e.toString(), status: SignupStatus.failure));
    }
  }
}



