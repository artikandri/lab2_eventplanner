import 'package:flutter/material.dart';
import 'package:eventplanner/theme/index.dart';

class EventCard extends StatelessWidget {
  final Color cardColor;
  final String title;
  final String subtitle;

  EventCard({
    this.cardColor,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;

    return Container(
      width: width * .6,
      margin: EdgeInsets.symmetric(vertical: AppSpacings.defaultSpacing, horizontal: AppSpacings.defaultSpacing),
      padding: EdgeInsets.all(AppSpacings.defaultSpacing * 2),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(AppSpacings.defaultSpacing),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: AppFonts.bodyFontSize,
                  color: AppColors.kDarkPurple,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: AppSpacings.defaultSpacing * 1.5),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: AppFonts.subFontSize,
                  color: AppColors.kDarkPurple,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
