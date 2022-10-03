import 'package:flutter/material.dart';
import 'quizbrain.dart';


QuizBrian quizBrian = new QuizBrian();

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}



void check_answers(bool user_answer, BuildContext context)
{
  if(quizBrian.curr_ques()<quizBrian.number_of_question()){
    if(quizBrian.answer() == user_answer ){
      quizBrian.score_kepper.add(Icon(Icons.check, color: Colors.green,));
    }
    else {
      quizBrian.score_kepper.add(Icon(Icons.close, color: Colors.red));
    }
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override


  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrian.question(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Container(
              width: 400,
              height: 50,
              child: Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      check_answers(true, context);
                      quizBrian.next_ques(context);
                    });
                  },
                  child: Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              color: Colors.green,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 400,
              height: 50,
              child: Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      check_answers(false, context);
                      quizBrian.next_ques(context);
                    });
                  },
                  child: Text(
                    'False',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              color: Colors.red,
            ),

          ),
        ),
        SizedBox(height: 50,),
        Row(children: quizBrian.score_kepper,)
      ],
    );
  }
}