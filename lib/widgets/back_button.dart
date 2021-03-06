import 'package:flutter/material.dart';
import 'package:eventplanner/theme/colors.dart';

class MyBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'backButton',
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: AppColors.kDarkPurple,
          ),
        ),
      ),
    );
  }
}
