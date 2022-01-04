import 'dart:convert';

import 'package:quizine/shared/models/quiz_model.dart';
import 'package:quizine/shared/models/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString("assets/database/user.json");
    final user = UserModel.fromJson(response);
    return user;
  }

  Future<List<QuizModel>> getQuizzes(weeks) async {
    for (var i = 0; i < weeks.length; i++) {
      int weekNum = int.parse(weeks[i].split(" ")[1]);
      print(weekNum);
    }

    final response =
        await rootBundle.loadString("assets/database/quizzes.json");
    final list = jsonDecode(response) as List;
    final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
    return quizzes;
  }
}






























//==========================================================================================================================

// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:quizine/shared/models/question_model.dart';
// import 'package:quizine/shared/models/quiz_model.dart';
// import 'package:quizine/shared/models/user_model.dart';
// import 'package:flutter/services.dart';
// import 'package:firebase_core/firebase_core.dart';

// class HomeRepository {
//   // UserModel getUser() {
//   //   final response = rootBundle.loadString("assets/database/user.json");
//   //   final user = UserModel.fromJson(response);
//   //   return user;
//   // }

//   List<QuizModel> getQuizzes(weeks) {
//     final asset = rootBundle.loadString("assets/database/quizzes.json");
//     //Map valueMap = json.decode(asset);
//     List<QuestionModel> fake = [];
//     List<QuizModel> fakequiz = [];

//     var firebaseReference = FirebaseFirestore.instance.collection('eng1weeks');

//     for (var i = 0; i < weeks.length; i++) {
//       int weekNum = int.parse(weeks[i].split(" ")[1]);
//       print(weekNum);
//       var questionData = FirebaseFirestore.instance
//           .collection('eng1weeks')
//           .doc('eng1week${weekNum}')
//           .get()
//           .then((DocumentSnapshot documentSnapshot) {
//         if (documentSnapshot.exists) {
//           print('Document data: ${documentSnapshot.data()}');
//           //var question = new QuestionModel(title: documentSnapshot.get(FieldPath(['questions'])), answers: answers, ansCount: ansCount)

//           var nested = documentSnapshot.get(FieldPath(['questions']));
//           fake = nested.map((s) => {
//                 QuestionModel(
//                     title: s.title, ansCount: s.ansCount, answers: s.answers)
//               });
//           //print(nested);
//           //valueMap[0]["questions"].addAll(nested);
//         } else {
//           print('Document does not exist on the database');
//         }
//       });

//       print("amiot");
//     }

//     var randomname = QuizModel(
//         title: 'English I', questions: fake, questionAnswered: 0, image: '');

//     fakequiz.add(randomname);
//     return fakequiz;

//     // String response = json.encode(valueMap);
//     // response = await "[${response}]";
//     // final list = jsonDecode(response) as List;
//     // final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
//     // return quizzes;
//   }
// }
