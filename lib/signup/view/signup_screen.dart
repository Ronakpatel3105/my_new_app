import 'package:flutter/material.dart';
import 'package:my_new_app/signup/view/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (context) => const SignupScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: SignupForm(),
      ),
    );
  }
}
