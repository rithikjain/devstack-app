import 'package:devtalks/src/presentation/themes/themes.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final String description;
  final int upvotes;

  QuestionCard({this.question, this.description, this.upvotes});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            height: 40,
            width: 40,
            child: Image.asset("assets/images/question_icon.png"),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 24, top: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question,
                    style: TextStyle(
                      color: lightBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      color: lightBlue,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlineButton(
                        child: Text(
                          "Upvote",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        textColor: Colors.green,
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            upvotes.toString(),
                            style: TextStyle(
                              color: palePink,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.thumb_up, color: palePink),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
