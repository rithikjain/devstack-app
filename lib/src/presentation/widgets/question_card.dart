import 'package:devtalks/src/presentation/themes/themes.dart';
import 'package:devtalks/src/presentation/widgets/delete_dialog.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final String description;
  final int upvotes;
  final bool isUpvoted;
  final bool showDelete;
  final String questionID;
  final Function onCancelUpvote;
  final Function onUpvote;

  QuestionCard({
    this.question,
    this.description,
    this.upvotes,
    this.onUpvote,
    this.onCancelUpvote,
    this.isUpvoted,
    this.showDelete,
    this.questionID,
  });

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
                      Row(
                        children: [
                          (!isUpvoted)
                              ? OutlineButton(
                                  child: Text(
                                    "Upvote",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: onUpvote,
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
                              : OutlineButton(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                        size: 18,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "Upvote",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: onCancelUpvote,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  textColor: Colors.red,
                                  highlightedBorderColor: Colors.red,
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2,
                                  ),
                                ),
                          SizedBox(width: 12),
                          Visibility(
                            visible: showDelete,
                            child: InkWell(
                              child: Icon(Icons.delete, color: palePink),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      DeleteDialog(questionID),
                                );
                              },
                            ),
                          ),
                        ],
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
