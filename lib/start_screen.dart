import 'package:flutter/material.dart';
import 'package:test/styled_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 250,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(
          height: 50,
        ),
        const StyledText(
          'Learn Flutter the fun way!',
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton.icon(
          onPressed: startQuiz,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.purple,
            textStyle: const TextStyle(
              fontSize: 18,
            ),
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz'),
        )
      ],
    );
  }
}
