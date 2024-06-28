import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> quizAnswers = [];
  var activeScreen = 'start';

  void switchScreen() {
    setState(() {
      activeScreen = 'quiz';
    });
  }

  void restart(){
    setState(() {
      quizAnswers=[];
      activeScreen = 'start';
    });

  }

  void addanswers(String ans) {
    quizAnswers.add(ans);
    if (quizAnswers.length == questions.length) {
      setState(() {
        //quizAnswers = [];
        activeScreen = 'result';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'quiz') {
      screenWidget = QuestionsScreen(onSelectAns: addanswers);
    }
    if (activeScreen == 'result') {
      screenWidget =  ResultsScreen(restart,selectedAns: quizAnswers,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromRGBO(98, 32, 212, 1),
              Color.fromARGB(255, 75, 35, 145)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: screenWidget,
        ),
      ),
    );
  }
}
