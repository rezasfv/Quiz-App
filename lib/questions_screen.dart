import 'package:flutter/material.dart';
import 'package:test/answer_button.dart';
import 'package:test/data/questions.dart';
import 'package:test/styled_text.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectAnswer) {
    widget.onSelectAnswer(selectAnswer);
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(context) {
    final curentQuestion = questions[currentQuestionIndex];
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StyledText(
          curentQuestion.text,
        ),
        const SizedBox(
          height: 30,
        ),
        ...curentQuestion.getShuffeledAnswers().map((answer) {
          return AnswerButton(
            answer,
            () {
              answerQuestion(answer);
            },
          );
        }),
      ],
    );
  }
}
