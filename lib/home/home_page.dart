import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizine/challenge/challenge_page.dart';
import 'package:quizine/core/core.dart';
import 'package:quizine/home/widgets/app_bar/app_bar_widget.dart';
import 'package:quizine/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:quizine/login/googleauth.dart';

import 'home_controller.dart';
import 'home_state.dart';
import 'widgets/level_button/level_button_widget.dart';

class HomePage extends StatefulWidget {
  final List<String> weeks;
  HomePage(this.weeks);
  //HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(weeks);
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  var weeks;
  _HomePageState(this.weeks);
  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes(weeks);
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
          appBar: AppBarWidget(
            userg: User,
            user: controller.user!,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // ElevatedButton.icon(
                //     style: ElevatedButton.styleFrom(
                //       primary: Colors.white,
                //       onPrimary: Colors.black,
                //       minimumSize: Size(double.infinity, 50),
                //     ),
                //     icon: FaIcon(
                //       FontAwesomeIcons.google,
                //       color: Colors.red,
                //     ),
                //     label: Text('Sign Out!'),
                //     onPressed: () {
                //       signOutnWithGoogle(context);
                //     })
                SizedBox(
                  height: 24,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     LevelButtonWidget(
                //       label: "Easy",
                //     ),
                //     LevelButtonWidget(
                //       label: "Medium",
                //     ),
                //     LevelButtonWidget(
                //       label: "Difficult",
                //     ),
                //     LevelButtonWidget(
                //       label: "Expert",
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    crossAxisCount: 2,
                    children: controller.quizzes!
                        .map((e) => QuizCardWidget(
                              title: e.title,
                              percent: e.questionAnswered / e.questions.length,
                              progress:
                                  "${e.questionAnswered}/${e.questions.length}",
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (contex) => ChallengePage(
                                        questions: e.questions,
                                        title: e.title,
                                      ),
                                    ));
                              },
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ));
    } else {
      return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
        )),
      );
    }
  }
}
























// ==============================================================================================



// import 'dart:convert';
// import 'dart:core';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:quizine/challenge/challenge_page.dart';
// import 'package:quizine/core/core.dart';
// import 'package:quizine/home/widgets/app_bar/app_bar_widget.dart';
// import 'package:quizine/home/widgets/quiz_card/quiz_card_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:quizine/shared/models/question_model.dart';
// import 'package:quizine/shared/models/quiz_model.dart';

// import 'home_controller.dart';
// import 'home_state.dart';
// import 'widgets/level_button/level_button_widget.dart';

// class HomePage extends StatefulWidget {
//   final List<String> weeks;

//   HomePage(
//     this.weeks,
//   );
//   //HomePage({Key? key}) : super(key: weeks);

//   @override
//   _HomePageState createState() => _HomePageState(weeks);
// }

// class _HomePageState extends State<HomePage> {
//   final controller = HomeController();

//   var weeks;
//   _HomePageState(this.weeks);
//   void randFuntion(weeks) async {
//     for (var i = 0; i < weeks.length; i++) {
//       int weekNum = int.parse(weeks[i].split(" ")[1]);
//       var questionData = await FirebaseFirestore.instance
//           .collection('eng1weeks')
//           .doc('eng1week${weekNum}')
//           .get()
//           .then((DocumentSnapshot documentSnapshot) {
//         if (documentSnapshot.exists) {
//           print('Document data: ${documentSnapshot.data()}');
//           var quest = documentSnapshot.get(FieldPath(["questions"]));
//           print(quest);
//           var questjson = jsonEncode(quest);
//           print(questjson);

          
//           //, answers: answers, ansCount: ansCount)
//           List<QuestionModel> questions = [];
//           var fake = questjson.map((s) => {

//           }
//           // documentSnapshot
//           //     .data()
//           //     .map((json) => QuestionModel.fromJson(json))
//           //     .toList();
//           // // print(nested);
//           // for (var i = 0; i < nested.length; i++) {
//           //   print(nested[i]);
//           //   print(nested[i].title);
//           //   print(nested[i]["title"]);

//           //   var fake = QuestionModel(
//           //       title: nested[i].title,
//           //       answers: nested[i].answers,
//           //       ansCount: nested[i].ansCount);
//           //   print(fake);
//           //   questions.add(fake);

//           // var fake = nested.map((s) => {
//           //       QuestionModel(
//           //           title: s.title, ansCount: s.ansCount, answers: s.answers)
//           //     });
//           // print(fake);
//           //print(nested);
//           //valueMap[0]["questions"].addAll(nested);
//         } else {
//           print('Document does not exist on the database');
//         }
//       });
//       print(weekNum);
//       print("randomS");
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     // controller.getUser();
//     //controller.getQuizzes(this.weeks);
//     randFuntion(this.weeks);
//     controller.stateNotifier.addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (controller.state == HomeState.success) {
//       return Scaffold(
//           appBar: AppBarWidget(
//               // user: controller.user!,
//               ),
//           body: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 24,
//                 ),
//                 // Row(
//                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //   children: [
//                 //     LevelButtonWidget(
//                 //       label: "Easy",
//                 //     ),
//                 //     LevelButtonWidget(
//                 //       label: "Medium",
//                 //     ),
//                 //     LevelButtonWidget(
//                 //       label: "Difficult",
//                 //     ),
//                 //     LevelButtonWidget(
//                 //       label: "Expert",
//                 //     ),
//                 //   ],
//                 // ),
//                 SizedBox(
//                   height: 24,
//                 ),
//                 Expanded(
//                   child: GridView.count(
//                     crossAxisSpacing: 16,
//                     mainAxisSpacing: 16,
//                     crossAxisCount: 2,
//                     children: controller.quizzes!
//                         .map((e) => QuizCardWidget(
//                               title: e.title,
//                               percent: e.questionAnswered / e.questions.length,
//                               progress:
//                                   "${e.questionAnswered}/${e.questions.length}",
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (contex) => ChallengePage(
//                                         questions: e.questions,
//                                         title: e.title,
//                                       ),
//                                     ));
//                               },
//                             ))
//                         .toList(),
//                   ),
//                 ),
//               ],
//             ),
//           ));
//     } else {
//       return Scaffold(
//         body: Center(
//             child: CircularProgressIndicator(
//           valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
//         )),
//       );
//     }
//   }
// }
