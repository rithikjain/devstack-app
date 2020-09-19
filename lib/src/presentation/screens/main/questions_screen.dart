import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devtalks/src/presentation/animations/show_up.dart';
import 'package:devtalks/src/presentation/themes/themes.dart';
import 'package:devtalks/src/presentation/widgets/question_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatelessWidget {
  final String _userID = FirebaseAuth.instance.currentUser.uid;

  @override
  Widget build(BuildContext context) {
    Query _questions = FirebaseFirestore.instance
        .collection("questions")
        .orderBy("upvotes", descending: true);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Text(
              "Questions",
              style: TextStyle(
                color: palePink,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8),
          StreamBuilder<QuerySnapshot>(
            stream: _questions.snapshots(includeMetadataChanges: true),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text("Something went wrong"));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container();
              }
              snapshot.data.docs.forEach((element) {
                print(element.data());
              });
              return Expanded(
                child: ShowUp(
                  delay: Duration(milliseconds: 200),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final question = snapshot.data.docs[index];
                      List<String> usersUpvoted =
                          List.from(question.data()["usersUpvoted"]);
                      if (usersUpvoted.contains(_userID)) {
                        print("Already Upvoted");
                      }
                      return QuestionCard(
                        question: question.data()["title"],
                        description: question.data()["description"],
                        upvotes: question.data()["upvotes"],
                        onUpvote: (question.data()["createdBy"] == _userID)
                            ? null
                            : () {},
                        isUpvoted: false,
                        onCancelUpvote: () {},
                      );
                    },
                    itemCount: snapshot.data.docs.length,
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
