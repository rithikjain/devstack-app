import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devtalks/src/presentation/themes/text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddQuestionDialog extends StatelessWidget {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final String _userID = FirebaseAuth.instance.currentUser.uid;

  @override
  Widget build(BuildContext context) {
    Future<void> addQuestion() {
      CollectionReference questions =
          FirebaseFirestore.instance.collection("questions");
      return questions.add({
        "createdBy": _userID,
        "description": _descController.text.trim(),
        "title": _titleController.text.trim(),
        "upvotes": 0,
        "usersUpvoted": [],
      });
    }

    return Dialog(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                Container(
                  child: Text(
                    "Ask a question",
                    style: BlueText.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    controller: _titleController,
                    maxLength: 40,
                    decoration: InputDecoration(
                      hintText: "Title",
                    ),
                    validator: (value) {
                      if (value.length < 3) {
                        return "Please enter a longer title";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    controller: _descController,
                    maxLines: 3,
                    maxLength: 100,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: "Description",
                    ),
                    validator: (value) {
                      if (value.length == 0) {
                        return "Please enter a description";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlineButton(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      highlightedBorderColor: Colors.red,
                      textColor: Colors.red,
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                    SizedBox(width: 16),
                    OutlineButton(
                      child: Text(
                        "Add",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          addQuestion();
                          Navigator.of(context).pop();
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      textColor: Colors.green,
                      highlightedBorderColor: Colors.green,
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
