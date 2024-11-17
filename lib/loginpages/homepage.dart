import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final user= FirebaseAuth.instance.currentUser!;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('LOGGED IN as:${user.email!}'),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap:() {
                FirebaseAuth.instance.signOut();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.deepPurple,
                ),
              child: const Padding(
              padding: EdgeInsets.all(10.0),
                child: Text('Sign Out', style: TextStyle(color: Colors.white),),
              ),
              ),
            )
            //  MaterialButton(
            //     onPressed: (){
            //     FirebaseAuth.instance.signOut();
            //   },
            //   color: Colors.deepPurple,
            //   child: const Text('Sign Out'),
              
            //   ),
          ],
        ),
      
      ),
    );
  }
}