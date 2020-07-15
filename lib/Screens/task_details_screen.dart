import 'package:flutter/material.dart';
import 'package:zonionap/Utilities/constants.dart';
import 'package:zonionap/Utilities/reusable_card.dart';
import 'package:zonionap/Utilities/round_button.dart';

class TaskDetailsScreen extends StatefulWidget {
  @override
  _TaskDetailsScreenState createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  String taskDetails;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Give task details...',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Expanded(
              child: ReusableCard(
                colour: Colors.grey,
                cardChild: Text('Add Instructions here'),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      taskDetails = value;
                    });
                  },
                  maxLines: 6,
                  decoration: kCircularTextField.copyWith(
                      hintText: "Give instructions here."),
                ),
              ),
            ),
            RoundButton(
              onTap: () {
                Navigator.pop(context, taskDetails);
              },
            ),
          ],
        ),
      ),
    );
  }
}
