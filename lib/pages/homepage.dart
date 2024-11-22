import 'package:auth_project/constats/listtile.dart';
//import 'package:auth_project/pages/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final user = FirebaseAuth.instance.currentUser!;
  bool isLoading = true; //To track if the data is still loading

  //create a lisf doccument IDs
  List<String> docIDs = [];

  @override
  void initState() {
    super.initState();
    getDocIds();// Fetching document IDs when the widget is built
  }

  //A method to get the document IDs
  Future getDocIds() async {
    try{
      docIDs.clear(); //Clear my old data
    final snapShot= await FirebaseFirestore.instance
        .collection('users')
        .get();
      for (var document in snapShot.docs) {
        docIDs.add(document.reference.id); //Adding each document into the List

      } setState(() {
        isLoading = false; // Mark loading as complete
      });
    } catch (e) {
      print('Error fetching document IDs: $e'); //Handle any error
    }
    
      }
  // A method to update 
  // Future updateDocIDs (String docIDs, Map<String, dynamic> updateData) async {
  //   await FirebaseFirestore.instance.collection('users')
  //   .doc(docIDs)
  //   .update(updateData);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.email!),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  
                },
                child: Icon(
                  Icons.logout,
                  color: Colors.black,
                )),
          )
        ],
      ),
      body: isLoading ? Center( child: CircularProgressIndicator()): 
      ListView.builder(
        itemCount: docIDs.length,
        itemBuilder:(context, index) {
          return MyListTile(
            documentIDs: docIDs[index], 
            onDelete:() {
              setState(() {
                docIDs.removeAt(index);
              });
            },);
        },
        ),
        
        );}
}
