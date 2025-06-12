import 'package:flutter/material.dart';
import 'package:sign_in/sign_in.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return SafeArea(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          body: SignIn(),
        ),
      ),
    );
  }
}