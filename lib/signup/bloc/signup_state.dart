
/*
import 'package:equatable/equatable.dart';

enum RegisterStatus {
  initial,
  success,
  failure,
  loading,
}

class RegisterState extends Equatable {
  const RegisterState({
    this.message = '',
    this.status = RegisterStatus.initial,
    this.email = '',
    this.password = '',
  });

  final String message;
  final RegisterStatus status;
  final String email;
  final String password;

  RegisterState copyWith({
    String? email,
    String? password,
    RegisterStatus? status,
    String? message,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        message,
        status,
        email,
        password,
      ];
}
*/

import 'package:equatable/equatable.dart';

enum SignupStatus { initial, submitting, success, error }

class SignupState extends Equatable {
  final String email;
  final String password;
  final SignupStatus status;

  const SignupState({
    required this.email,
    required this.password,
    required this.status,
  });

  factory SignupState.initial() {
    return const SignupState(
      email: '',
      password: '',
      status: SignupStatus.initial,
    );
  }

  SignupState copyWith({
    String? email,
    String? password,
    SignupStatus? status,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, status];
}