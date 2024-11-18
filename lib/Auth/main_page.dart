//This helps us know wether the user is logged in or not

import 'package:auth_project/Auth/auth_page.dart';
//import 'package:auth_project/pages/loginscreen.dart';
import 'package:auth_project/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder:(context, snapshot) {
          if(snapshot.hasData){
            return Homepage();
          }else{
            //Let it check for the authPage to determine where the user is in the login page or register page
            return AuthPage();
          } 
        },),
    );
  }
}