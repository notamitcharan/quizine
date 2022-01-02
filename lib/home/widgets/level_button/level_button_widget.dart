import 'package:quizine/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  LevelButtonWidget({Key? key, required this.label})
      : assert(["Easy", "Medium", "Difficult", "Expert"].contains(label)),
        super(key: key);

  final config = {
    "Easy": {
      "color": AppColors.levelButtonEasy,
      "borderColor": AppColors.levelButtonBorderEasy,
      "fontColor": AppColors.levelButtonTextEasy,
    },
    "Medium": {
      "color": AppColors.levelButtonMedium,
      "borderColor": AppColors.levelButtonBorderMedium,
      "fontColor": AppColors.levelButtonTextMedium,
    },
    "Difficult": {
      "color": AppColors.levelButtonDifficult,
      "borderColor": AppColors.levelButtonBorderDifficult,
      "fontColor": AppColors.levelButtonTextDifficult,
    },
    "Expert": {
      "color": AppColors.levelButtonExpert,
      "borderColor": AppColors.levelButtonBorderExpert,
      "fontColor": AppColors.levelButtonTextExpert,
    },
  };

  Color get color => config[label]!['color']!;
  Color get borderColor => config[label]!['borderColor']!;
  Color get fontColor => config[label]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(28),
        border: Border.fromBorderSide(
          BorderSide(
            color: borderColor,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Text(
          this.label,
          style: GoogleFonts.notoSans(
            color: fontColor,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
