import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devtalks/src/presentation/themes/text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddQuestionDialog extends StatelessWidget {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

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
                child: TextField(
                  controller: _titleController,
                  maxLength: 40,
                  decoration: InputDecoration(
                    hintText: "Title",
                  ),
                ),
              ),
              SizedBox(height: 4),
              Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                child: TextField(
                  controller: _descController,
                  maxLines: 3,
                  maxLength: 100,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Description",
                  ),
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
                      addQuestion();
                      Navigator.of(context).pop();
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
    );
  }
}
