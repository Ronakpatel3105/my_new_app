part of 'app_bloc.dart';

/*enum AppStatus {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  final AppStatus status;
  final User user;

  const AppState._({
    required this.status,
    this.user = User.empty,
  });

  const AppState.authenticated(User user)
      : this._(status: AppStatus.authenticated, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  @override
  List<Object> get props => [status, user];
}
*/

/*enum AppStatus {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  final AppStatus status;
  final User? user;

  const AppState({required this.status, this.user});

  static AppState authenticated(User user) {
    return AppState(status: AppStatus.authenticated, user: user);
  }

  static AppState unauthenticated() {
    return const AppState(status: AppStatus.unauthenticated);
  }

  AppState copyWith({
    AppStatus? status,
    User? user,
  }) =>
      AppState(status: status ?? this.status, user: user ?? this.user);

  @override
  List<Object?> get props => [status, user];
}*/

/*enum AppStatus { authenticated, unauthenticated }

class AppState extends Equatable {
  final AppStatus status;
  final User user;

  const AppState._({
    required this.status,
    this.user = User.empty,
  });

  const AppState.authenticated(User user)
      : this._(
    status: AppStatus.authenticated,
    user: user,
  );

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  @override
  List<Object> get props => [status, user];
}
*/