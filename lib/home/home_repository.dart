import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:quizine/shared/models/quiz_model.dart';
import 'package:quizine/shared/models/user_model.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString("assets/database/user.json");
    final user = UserModel.fromJson(response);
    return user;
  }

  Future<List<QuizModel>> getQuizzes(weeks) async {
    final asset = await rootBundle.loadString("assets/database/quizzes.json");

    Map valueMap = json.decode(asset);

    var db = FirebaseFirestore.instance.collection('eng1weeks').doc('allweek');
    await db.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        for (var i = 0; i < weeks.length; i++) {
          int weekNum = int.parse(weeks[i].split(" ")[1]);
          List nested = documentSnapshot.get(FieldPath(
            ['eng1week${weekNum}', 'questions'],
          ));
          valueMap["questions"].addAll(nested);
        }
        print(valueMap);
        return valueMap as Map;
      } else {
        Map dummy = {"amit": "charan"};
        print('Document does not exist on the database');
        return dummy as Map;
      }
    });

//     await FirebaseFirestore.instance
//         .collection('eng1weeks')
//         .doc('eng1week6')
//         .get()
//         .then((DocumentSnapshot documentSnapshot) {});
//     String response = await json.encode(valueMap);
    String response = json.encode(valueMap);
    response = ("[${response}]");
    final list = jsonDecode(response) as List;
    final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
    return quizzes;
  }

  Future<Map> terminator(weeks, String asset) async {
    Map valueMap = json.decode(asset);
    var db = FirebaseFirestore.instance.collection('eng1weeks').doc('allweek');
    await db.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        for (var i = 0; i < weeks.length; i++) {
          int weekNum = int.parse(weeks[i].split(" ")[1]);
          List nested = documentSnapshot.get(FieldPath(
            ['eng1week${weekNum}', 'questions'],
          ));
          valueMap["questions"].addAll(nested);
        }
        print(valueMap);
        return valueMap as Map;
      } else {
        Map dummy = {"amit": "charan"};
        print('Document does not exist on the database');
        return dummy as Map;
      }
    });

    return valueMap;
  }
}





//     final response =
//         await rootBundle.loadString("assets/database/quizzes.json");
//     final list = jsonDecode(response) as List;
//     final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
//     return quizzes;
//   }
// }