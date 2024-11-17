//This helps us know wether the user is logged in or not

import 'package:auth_project/home_screen.dart';
import 'package:auth_project/loginpages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder:(context, snapshot) {
          if(snapshot.hasData){
            return Homepage();
          }else{
            return LoginScreen();
          } 
        },),
    );
  }
}