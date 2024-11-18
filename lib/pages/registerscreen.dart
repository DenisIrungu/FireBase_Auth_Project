import 'package:auth_project/constats/colors.dart';
import 'package:auth_project/constats/textfields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterScreen({super.key, required this.showLoginPage});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future signUp() async {
    // if(passwordConfirmed()) {
    //   await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //     email: emailController.text.trim(), 
    //     password: passwordController.text.trim());

    // }
    if (passwordConfirmed()) {
      try {
        // Attempt to create a new user with the provided email and password
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        // Display a success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration Successful')),
        );
      } on FirebaseAuthException catch (e) {
        // Handle Firebase-specific errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'An error occurred')),
        );
      }
    } else {
      // If passwords do not match, show an error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
    }
   }

  bool passwordConfirmed() {
    return passwordController.text.trim() ==
        confirmPasswordController.text.trim();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'HELLO THERE',
                  style: GoogleFonts.bebasNeue(
                      fontSize: 52, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Register below with your details',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextFields(
                  hintText: 'Email',
                  obscureText: false,
                  controller: emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextFields(
                    controller: passwordController,
                    hintText: 'PassWord',
                    obscureText: true),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextFields(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.deepPurple),
                        child: const Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I am a Member?',
                      style: TextStyle(
                          color: Colors.grey[300],
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(' Login',
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
