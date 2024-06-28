import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.restart, {super.key, required this.selectedAns});
  final void Function() restart;
  final List<String> selectedAns;

  List<Map<String, Object>> getData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < selectedAns.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'user_answer': selectedAns[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getData();
    final totalquestions = questions.length;
    final totalcorrect = summaryData.where((e) {
      return e['user_answer'] == e['correct_answer'];
    
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
                'You answered $totalcorrect out of $totalquestions questions correctly',
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
                
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton(onPressed: restart, child: const Text('Restart quiz'))
          ],
        ),
      ),
    );
  }
}
