import 'package:flutter/material.dart';
import 'package:eventplanner/theme/index.dart';
import 'package:eventplanner/components/index.dart';

class EventListItem extends StatelessWidget {
  final IconData eventIcon;
  final String title;
  final String subtitle;
  final String date;

  EventListItem({
    this.title,
    this.subtitle,
    this.date,
    this.eventIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSpacings.defaultSpacing),
      padding: EdgeInsets.all(AppSpacings.defaultSpacing * 2),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.5, color: Colors.grey[300]),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              iconContainer(eventIcon),
              Column(children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: AppFonts.bodyFontSize,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: AppFonts.bodyFontSize * .75,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ]),
              Text(
                date,
                style: TextStyle(
                  fontSize: AppFonts.bodyFontSize,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
