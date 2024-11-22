import 'package:auth_project/constats/textfields.dart';
import 'package:auth_project/pages/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyListTile extends StatefulWidget {
  final String documentIDs;
  final VoidCallback onDelete;// A CallBack to notify the parent widget

  MyListTile({
    super.key, 
    required this.documentIDs,
    required this.onDelete});

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
final firstNameController = TextEditingController();

    @override
    void dispose() {
      // Dispose the controller to free up resources
      firstNameController.dispose();
      super.dispose();
    }

  void _showEditDialog(BuildContext context, String docIDs) {
    
// Amethod to update details
    Future updateDocIDs(String docIDs, Map<String, dynamic> updateData) async {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(docIDs)
          .update(updateData);
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Details'),
          content: MyTextFields(
              controller: firstNameController,
              hintText: 'First Name',
              obscureText: false),
          actions: [
            MaterialButton(
              color: Colors.deepPurple,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            MaterialButton(
                color: Colors.deepPurple,
                onPressed: () {
                  updateDocIDs(
                      docIDs, {'First Name': firstNameController.text});
                  Navigator.pop(context);
                  setState(() {});
                },
                child: Text('Update'))
          ],
        );
      },
    );
  }
  // A method to delete
  Future deleteDetails(String docIDs) async {
    await FirebaseFirestore.instance
      .collection('users') 
      .doc(docIDs)
      .delete();
    widget.onDelete(); //Notify the the parent widget to remove
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        child: ListTile(
            tileColor: Colors.grey,
            title: GetDetails(documentIDs: widget.documentIDs),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => _showEditDialog(context, widget.documentIDs),
                  child: const Icon(
                    Icons.edit,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap:() {
                    deleteDetails(widget.documentIDs).then((_){
                      setState(() {
                        
                      });
                    });
                  },
                  child: Icon(Icons.delete))
              ],
            )),
      ),
    );
  }
}
