//import 'package:auth_project/home_screen.dart';
import 'package:auth_project/Auth/main_page.dart';
import 'package:auth_project/pages/forgetpassword.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();

  
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
      routes: {
        '/forgetpassword': (context) => const ForgetPassword()
      },
    );
  }
}