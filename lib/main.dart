import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in/app_bindings.dart';
import 'package:sign_in/sign_in_screen.dart';

void main() {
   MyBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SignInScreen(),
    );
  }
}

