import 'package:flutter/cupertino.dart';

import '../app_bloc/app_bloc.dart';
import '../home/home_screen.dart';
import '../login/view/login_screen.dart';

List<Page<dynamic>> onGenerateAppViewPages(
    AppStatus state,
    List<Page<dynamic>> pages,
    ) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeScreen.page()];
    case AppStatus.unauthenticated:
      return [LoginScreen.page()];
  }
}