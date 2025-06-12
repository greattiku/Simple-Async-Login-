import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_validations.dart';
import 'reusable_text_field.dart';
import 'widget.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
    final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 70, left: 15,right: 15,bottom: 15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Text('Sign In',
                    style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24)
                    ),
                  Text('Welcome Back!',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Color(0XFFADADAD))
                    ),
                    SizedBox(height: 10),
      
                  ReusableTextField(
                  controller: emailController,
                  text: 'Email',
                  validator: 
                    validateEmail
                  ),
            
                SizedBox(height: 10),
      
                Obx(()=>
                     ReusableTextField(
                      controller: passwordController,
                      text: 'Password',
                      isPasswordField: true,
                      icon: 
                        IconButton(onPressed: (){
                         controller.passwordToggleObscure();
                         }, icon: Icon(
                           controller.isPasswordObscured.value ? Icons.visibility_off : Icons.visibility,
                          )),
                            
                     validator: validatePassword
                      ),
                  ),
            
                SizedBox(height: 10),
      
               SizedBox(height: 15),
                 Obx(()=>
                    ElevatedButton(onPressed: (){
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        login();
                      }
                    }, 
                      style: ButtonStyles.elevatedButtonStyle(
                      backgroundColor: Colors.green,
                      minimumSize: Size(390, 52),
                      borderRadius: BorderRadius.circular(8)
                      ),
                      child: controller.isLoading.value 
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                        :Text('Login',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white
                    ),)
                                 ),
                 ),

              SizedBox(height:10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?',
                    style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.grey
                  ),
                  ),
                  //SizedBox(width: 1.0.h,),
                  TextButton(onPressed: (){
                    
                  }, 
                  child: Text('SignUp',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.blue
                  ),))
                  
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}