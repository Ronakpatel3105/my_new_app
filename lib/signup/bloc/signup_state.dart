

import 'package:equatable/equatable.dart';

enum SignupStatus {
  initial,
  success,
  failure,
  loading,
}

class SignupState extends Equatable {
  const SignupState({
    this.message = '',
    this.status = SignupStatus.initial,
    this.email = '',
    this.password = '',
  });

  final String message;
  final SignupStatus status;
  final String email;
  final String password;

  SignupState copyWith({
    String? email,
    String? password,
    SignupStatus? status,
    String? message,
  }) {
    return SignupState(
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


