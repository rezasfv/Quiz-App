import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:test/data/questions.dart';
import 'package:test/questions_summary.dart';
import 'package:test/styled_text.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StyledText(
          'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
        ),
        const SizedBox(
          height: 30,
        ),
        QuestionsSummary(summaryData),
        const SizedBox(
          height: 30,
        ),
        // TextButton(
        //   onPressed: () {},
        //   child: Text(
        //     'Restart Quiz',
        //     style: GoogleFonts.lato(
        //       fontSize: 16,
        //       color: const Color.fromARGB(216, 255, 255, 255),
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
