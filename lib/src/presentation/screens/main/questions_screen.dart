import 'package:devtalks/src/presentation/themes/themes.dart';
import 'package:devtalks/src/presentation/widgets/question_card.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => QuestionCard(
                question: "What is DevStack",
                description: "Devstack is an event oragnised by DSC VIT.",
                upvotes: 10,
              ),
              itemCount: 5,
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
