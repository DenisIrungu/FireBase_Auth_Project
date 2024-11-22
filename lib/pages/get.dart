// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetDetails extends StatelessWidget {
  final String documentIDs;
  GetDetails({super.key, required this.documentIDs});

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentIDs).get(),
      builder: (context, snapshot) {
        // Handle loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }
        //Lets handle the error state
        if(snapshot.hasError){
          return Text('Error while fetching data');
        }
        // Lets handle case when data is null or document does not exist
        if (!snapshot.hasData || snapshot.data == null || !snapshot.data!.exists) {
          return const Text('Document does not exist');
        }
        // Safely access data
        final data = snapshot.data!.data() as Map<String, dynamic>?;

        if (data == null || !data.containsKey('First Name')) {
          return const Text('No data available');
        }
        return Text('First Name: ${data['First Name']}');
        
        // if (snapshot.connectionState == ConnectionState.done) {
        //   Map<String, dynamic> data =
        //       snapshot.data!.data() as Map<String, dynamic>;
        //   return Text('First Name: ${data['First Name']}');
        // }
        // return const Text('loading..');
      },
    );
  }
}
