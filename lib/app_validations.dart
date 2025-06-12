
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in/user_model.dart';

import 'auth_controller.dart';

    
    var controller =  Get.find<AuthController>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    


      List<UserModel> users = [
    UserModel(email: 'great@gmail.com', password: 'Password1'),
    UserModel(email: 'ginika@gmail.com', password: 'Password2'),
  ];



   String? validateEmail(String? value){
    if(value == null){
      return 'Please enter your email';
    } else if(!value.contains('@') || !value.contains('.')){
      return 'Invalid email address';
    } else{
      return null;
    }
  }

   String? validatePassword(String? value){
    if (value == null || value.isEmpty) {
        return 'Please enter a password';
      } else if (value.length < 8) {
        return 'Password must be at least 8 characters';
      } else if (!value.contains(RegExp(r'[A-Z]'))) {
        return 'Password must contain at least one uppercase letter';
      } else if (!value.contains(RegExp(r'[a-z]'))) {
        return 'Password must contain at least one lowercase letter';
      } else if (!value.contains(RegExp(r'[0-9]'))) {
        return 'Password must contain at least one number';
      }
        return null;
  } 

     login() async{
      controller.isLoading.value = true;
         UserModel userToLogin = UserModel(
      email: emailController.text,
      password: passwordController.text,
    );

      final completer = Completer<String>();

       final existingUser = users.firstWhere(
        (u) => u.email == userToLogin.email && u.password == userToLogin.password,
        orElse: () => UserModel(email: '', password: ''),
      );

      
      try {
        await Future.delayed(Duration(seconds: 3));
      if (existingUser.email.isNotEmpty && existingUser.password.isNotEmpty) {
         completer.complete('Sign in successfull');
         Get.snackbar('Success', 'Sign in successfull');
      } else{
         completer.complete('Invalid email or password') ;
          Get.snackbar('Failed', 'Invalid email or password');
      }
      } catch (e) {
        
        controller.isLoading.value = false;
        completer.completeError(e);
        
      } finally{
        controller.isLoading.value = false;
      }
      return completer.future;

    }


