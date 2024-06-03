import 'package:flutter/material.dart';
import '../../model/question_model.dart';
import '../screens/game_over.dart';
import '../screens/template_game.dart';
import 'correct_answer.dart';

class QuestionWidget extends StatefulWidget {
  final Question question;

  const QuestionWidget({super.key, required this.question});

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  bool answerSelected = false;
  bool isCorrectAnswer = false;
  String selectedAnswer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const TemplateGameScreen(),
          Positioned.fill(
            child: Image.asset(
              'assets/images/question_label.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                widget.question.question,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: 0,
            right: 0,
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 90,
              padding: const EdgeInsets.all(10),
              children: widget.question.answers.map((option) {
                return buildButton(
                  key: Key(option),
                  buttonText: option,
                  isSelected: selectedAnswer == option,
                  onPressed: () {
                    selectAnswer(option);
                  },
                  imagePath: 'assets/images/button.png',
                );
              }).toList(),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.25,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton(
                  key: const Key('skip_button'),
                  buttonText: 'דלג',
                  isSelected: true,
                  imagePath: 'assets/images/bottom_borad.png',
                  onPressed: () {
                    if (!answerSelected || !isCorrectAnswer) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GameOver(),
                        ),
                      );
                    }
                  },
                ),
                buildButton(
                  key: const Key('check_answer_button'),
                  buttonText: 'סיימתי',
                  isSelected: answerSelected,
                  imagePath: 'assets/images/bottom_borad.png',
                  onPressed: () {
                    if (answerSelected) {
                      if (isCorrectAnswer) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CorrectAnswer(),
                          ),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void selectAnswer(String answer) {
    setState(() {
      answerSelected = true;
      selectedAnswer = answer;

      if (answer == widget.question.answers[widget.question.correctAnswer]) {
        isCorrectAnswer = true;
      }
    });
  }

  Widget buildButton({
    required String buttonText,
    required VoidCallback onPressed,
    required bool isSelected,
    required Key key,
    required String imagePath,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Opacity(
        opacity: isSelected ? 1.0 : 0.6,
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.scaleDown,
            ),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
