import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Quiz()
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  // class variables
  int groupValue = 2;
  // currentQuestion is used to iterate the array/list
  int currentQuestion = 0;
  //questions[currentQuestion] questions[0]
  // keep track of the score
  int score = 0;

  var questions = [
    'A group of flamingos is called a "flamboyance".',
    'Sharks are mammals.',
    'An octopus has three hearts.',
    'Cows can sleep standing up, but they can only dream lying down.',
    'Bats are the only mammals capable of sustained flight.',
    'Penguins can fly.',
    'A snail can sleep for up to three years.',
    'Elephants are the only animals that cannot jump.',
    'Sloths can hold their breath longer than dolphins can.',
    'Goldfish have a three-second memory.'
  ];
  var answers = [1, 0, 1, 1, 1, 0, 1, 1, 1, 0];
  
  // display correct/incorrect
  String result = ""; 

  Color responseColor = const Color.fromARGB(0, 244, 67, 54);

  // class methods
  checkAnswer(int answer) {

    print('User answer: $answer');

    if (answers[currentQuestion] == answer) {
      print("Correct");
      score++;
      result = "Correct";
      responseColor = Colors.green;
    } else {
      print("Incorrect");
      result = "Incorrect";
      responseColor = Colors.red;
    }
    // if answer is true or false, set the score and show the result of correct /incorrect
    // set the groupValue to activate the radio button
    setState(() {
      groupValue = answer;
    });

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text("Quiz App"),),
      body: Padding(
        padding: EdgeInsets.all(36.6),
        child: Column(
          children: <Widget>[
            Text(questions[currentQuestion], style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),),
            SizedBox(
              //Use of SizedBox
              height: 30,
            ),
            Row(children: <Widget>[
              Radio(value: 1, groupValue: groupValue, onChanged: (e)=>{checkAnswer(e!)}),
              Text("True", style: TextStyle(
                color: Colors.white,
              ),),
              Radio(value: 0, groupValue: groupValue, onChanged: (e)=>{checkAnswer(e!)}),
              Text("False", style: TextStyle(
                color: Colors.white,
              ),),
            ],),
            SizedBox(
              //Use of SizedBox
              height: 30,
            ),
            TextButton(onPressed: ()=>{
              setState(() {
                groupValue = 2;
                result = "";
                if (currentQuestion < questions.length - 1) {
                  currentQuestion++;
                }
              })
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            child: Text("Next", style: TextStyle(
              color: Colors.white,
            ),),),
            SizedBox(
              //Use of SizedBox
              height: 30,
            ),
            Text(result, style: TextStyle(
                backgroundColor: responseColor,
                color: Colors.white,
            ),),
            SizedBox(
              //Use of SizedBox
              height: 30,
            ),
            Text("Score: $score", style: TextStyle(
              fontSize: 40.0,
              color: Colors.white,
            ),),
          ]
        ),),
    );
  }
}