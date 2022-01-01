import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:quizine/challenge/widget/next_button/next_button_widget.dart';
import 'package:quizine/core/core.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  const ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  'Congrats',
                  style: AppTextStyles.heading40,
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: Text.rich(
                    TextSpan(
                      text: 'You have concluded the quiz ',
                      style: AppTextStyles.heading,
                      children: [
                        TextSpan(
                          text: title,
                          style: AppTextStyles.heading,
                        ),
                        TextSpan(
                          text: '\n\n\n\n\n You answered $result of $length correctly. \n The topics we found to be weak are <TAG>',
                          style: AppTextStyles.heading,
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.purple(
                            label: 'Share Report',
                            onTap: () {
                              Share.share(
                                  ' $title: Scored $result out of $length');
                            }),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 34,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.transparent(
                            label: 'Back to Home',
                            onTap: () {
                              Navigator.pop(context);
                            }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
