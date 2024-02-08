/*import 'package:equatable/equatable.dart';

enum LoginStatus {
  initial,
  success,
  failure,
  loading,
}

class LoginState extends Equatable {
  const LoginState({
    this.message = '',
    this.status = LoginStatus.initial,
    this.email = '',
    this.password = '',
  });

  final String message;
  final LoginStatus status;
  final String email;
  final String password;

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
    String? message,
  }) {
    return LoginState(
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
}*/

import 'package:equatable/equatable.dart';

enum LoginStatus { initial, submitting, success, error }

class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginStatus status;

  const LoginState({
    required this.email,
    required this.password,
    required this.status,
  });

  factory LoginState.initial() {
    return const LoginState(
      email: '',
      password: '',
      status: LoginStatus.initial,
    );
  }

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, status];
}
