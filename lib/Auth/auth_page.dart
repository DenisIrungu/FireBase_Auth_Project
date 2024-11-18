import 'package:auth_project/pages/loginscreen.dart';
import 'package:auth_project/pages/registerscreen.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreens(){
    setState(() {
      showLoginPage= !showLoginPage;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginScreen(showRegisterPage: toggleScreens);
    }else {
      return RegisterScreen(showLoginPage: toggleScreens);
    }
  }
}