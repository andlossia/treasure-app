class Question {
  late int questionID;
  late String question;
  List<String> answers = [];
  late int correctAnswer;

  Question({
    required this.questionID,
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}

List<Question> questions = [
  Question(
    questionID: 1,
    question: 'What is the name of the capital of France?',
    answers: [
      'Paris',
      'London',
      'Berlin',
      'Madrid',
    ],
    correctAnswer: 0,
  ),
  Question(
    questionID: 2,
    question: 'What is the name of the capital of Spain?',
    answers: [
      'Paris',
      'London',
      'Berlin',
      'Madrid',
    ],
    correctAnswer: 3,
  ),
];
