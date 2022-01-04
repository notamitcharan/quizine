import 'package:quizine/home/home_state.dart';
import 'package:quizine/shared/models/quiz_model.dart';
import 'package:quizine/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

import 'home_repository.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.success;
  }

  void getQuizzes(weeks) async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes(weeks);
    state = HomeState.success;
  }
}
