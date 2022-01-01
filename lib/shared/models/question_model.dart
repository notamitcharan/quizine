import 'dart:convert';

import 'package:quizine/shared/models/answer_model.dart';

class QuestionModel {
  final String title;
  final List<AnswerModel> answers;
  final int ansCount;

  QuestionModel({required this.title, required this.answers, required this.ansCount})
      : assert(
          answers.length == ansCount,
        );

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      ansCount: map['ansCount'],
      answers: List<AnswerModel>.from(
          map['answers']?.map((x) => AnswerModel.fromMap(x)))
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}
