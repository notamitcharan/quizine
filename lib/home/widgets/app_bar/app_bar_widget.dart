import 'package:quizine/core/core.dart';
import 'package:quizine/home/widgets/score_card/score_card_widget.dart';
import 'package:quizine/shared/models/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final User? userg = auth.currentUser;

class AppBarWidget extends PreferredSize {
  var userg;

  // here you write the codes to input the data into firestore
  User? get userr => userg;
  final UserModel user;
  AppBarWidget({Key? key, required this.user, required this.userg})
      : super(
          key: key,
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 280,
            child: Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 192,
                  decoration: BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: 'Hello!  ',
                            style: AppTextStyles.title,
                            children: [
                              TextSpan(
                                text: user.name,
                                style: AppTextStyles.titleBold,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                user.photoUrl,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment(0.0, 1.0), child: ScoreCardeWidget()),
              ],
            ),
          ),
        );
}
