import 'package:flutter/material.dart';
import 'package:treasure/model/question_model.dart';
import 'package:treasure/view/screens/template_game.dart';

import '../../controller/task_controller.dart';
import '../widgets/question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  Question? currentQuestionTask;

  @override
  void initState() {
    super.initState();
    if (TaskController.currentIndex >= 0 &&
        TaskController.currentIndex < questions.length) {
      currentQuestionTask = questions[TaskController.currentIndex];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const TemplateGameScreen(),
          if (currentQuestionTask != null)
            Center(
              child: QuestionWidget(
                question: currentQuestionTask!,
              ),
            ),
          Positioned(
            bottom: 40,
            right: 60,
            child: Image.asset(
              'assets/images/avatar_pirate.png',
            ),
          ),
        ],
      ),
    );
  }
}
