import 'dart:ffi';
import 'main.dart';

import 'Question.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrian
{
  List<Icon> score_kepper = [];

  int _quesiton_number = 0;

  List<Quesiton> _qus = [Quesiton(q: 'The Takshal Modi is greatest', a: true), Quesiton(q: 'Sun Rises in West', a: false), Quesiton(q: 'I have choosen IIITV', a: true)];


  String question()
  {
    return _qus[_quesiton_number].ques;
  }

  bool answer()
  {
    return _qus[_quesiton_number].ans;
  }

  void next_ques(BuildContext context)
  {
    if(_quesiton_number<_qus.length-1)
      {
        _quesiton_number++;
      }
    else
      {
        Alert(
          context: context,
          type: AlertType.success,
          title: "End!!",
          desc: "You have ended the quiz!!",
          buttons: [
            DialogButton(
              child: Text(
                "Restart",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                _quesiton_number = 0;
                score_kepper.clear();
                Navigator.pop(context);

              },
              width: 120,
            )
          ],
        ).show();
      }
  }

  int curr_ques()
  {
    return _quesiton_number;
  }

  int number_of_question()
  {
    return _qus.length;
  }
}