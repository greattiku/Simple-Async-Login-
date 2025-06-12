import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_validations.dart';

class AuthController extends GetxController{
    var isPasswordObscured = true.obs;
    var isPasswordMatch = false.obs;
    var isLoading = false.obs;

    //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  

  passwordToggleObscure(){
    isPasswordObscured.value = !isPasswordObscured.value;
  }



  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
   
    super.dispose();
  }

  

}