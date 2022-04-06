import 'package:flutter/material.dart';
import 'package:eventplanner/theme/index.dart';
import 'package:eventplanner/components/index.dart';

class EventListItem extends StatelessWidget {
  final IconData eventIcon;
  final String title;
  final String subtitle;
  final String date;
  final Color eventColor;

  EventListItem({this.title, this.subtitle, this.date, this.eventIcon, this.eventColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 20.0,
          backgroundColor: eventColor == null ? AppColors.kLightGreen : eventColor,
          child: Icon(
            eventIcon,
            size: AppSpacings.defaultSpacing * 2,
            color: Colors.white,
          ),
        ),
        SizedBox(width: AppSpacings.defaultSpacing * 2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: AppFonts.bodyFontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: AppFonts.subFontSize, fontWeight: FontWeight.w500, color: Colors.black45),
            ),
          ],
        ),
        SizedBox(width: AppSpacings.defaultSpacing * 2),
        Text(
          date,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: AppFonts.subFontSize,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
