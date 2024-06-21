import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_new_app/login/bloc/login_bloc.dart';
import 'package:my_new_app/repository/auth_repository.dart';
import 'package:my_new_app/signup/bloc/signup_bloc.dart';
import 'package:my_new_app/signup/view/signup_screen.dart';

import 'bloc_observer.dart';
import 'firebase_options.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      final authRepository = AuthRepository();
      runApp(App(authRepository: authRepository));
    },
    blocObserver: AppBlocObserver(),
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(key: key);

  final AuthRepository _authRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => SignupBloc(authRepository: AuthRepository())),
      BlocProvider(create: (context) => LoginBloc(authRepository: AuthRepository())),
    ], child: const AppView());

  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignupScreen(),
    );
  }
}
