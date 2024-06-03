import '../model/task_model.dart';

class TaskController {
  static List<Task> questions = [];
  static int currentIndex = 0;

  static void addTask(Task task) {
    questions.add(task);
    if (currentIndex == 0) {
      currentIndex = 0;
    }
  }

  static void nextQuestion() {
    currentIndex++;
  }

  static void reset() {
    currentIndex = 0;
  }
}
