import 'question_model.dart';
import 'media_model.dart';

class Task {
  late int taskID;
  late String name;
  late String? description;
  List<String>? taskFreeTexts;
  Question question;
  List<Media>? mediaList;

  Task({
    required this.taskID,
    required this.name,
    this.description,
    this.taskFreeTexts,
    required this.question,
    this.mediaList,
  });
}
