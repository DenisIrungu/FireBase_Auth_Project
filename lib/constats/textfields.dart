import 'package:auth_project/constats/colors.dart';
import 'package:flutter/material.dart';
//import 'package:login_auth/constants/colors.dart';

class MyTextFields extends StatelessWidget {
  final controller;
  final hintText;
  final obscureText;
  
   const MyTextFields({super.key,
  required this.controller,
  required this.hintText,
  required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundcolor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(12)
          ),
        child: Padding(
          padding:const  EdgeInsets.only(left: 8.0),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText
            ),
          
          ),
        ),
      ),
    );
    
  }
}