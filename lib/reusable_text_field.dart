import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class ReusableTextField extends StatefulWidget {
  const ReusableTextField({super.key,
  this.text,
  required this.controller,
  this.validator,
  this.isPasswordField = false,
  this.icon,
  });
  final String? text;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  
  final bool isPasswordField;
  final Widget? icon;

  @override
  State<ReusableTextField> createState() => _ReusableTextFieldState();
}

class _ReusableTextFieldState extends State<ReusableTextField> {
    var controller =  Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
            Text(widget.text ?? '',
                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16)
            ),
               TextFormField(
                obscureText: widget.isPasswordField  ? controller.isPasswordObscured.value : false,
                validator: widget.validator,
                controller: widget.controller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                   suffixIcon: widget.icon,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.green,
                    )
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red
                    )
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.red
                    )
                  )
              )
              ),
      ],
    );
  }
}




