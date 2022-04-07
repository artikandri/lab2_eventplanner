import 'package:flutter/material.dart';
import 'package:eventplanner/theme/index.dart';
import 'package:eventplanner/components/index.dart';

class EventListItem extends StatelessWidget {
  final IconData eventIcon;
  final String title;
  final String subtitle;
  final String date;
  final Color eventColor;
  final double opacity;

  EventListItem({this.title, this.subtitle, this.date, this.eventIcon, this.eventColor, this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(AppSpacings.defaultSpacing * 2),
        child: Opacity(
            opacity: opacity,
            child: Row(
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
                SizedBox(height: AppSpacings.defaultSpacing),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: AppFonts.bodyFontSize,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: AppSpacings.defaultSpacing),
                    Text(
                      date,
                      style: TextStyle(fontSize: AppFonts.subFontSize, fontWeight: FontWeight.w300, color: Colors.black45),
                    ),
                  ],
                ),
                SizedBox(width: AppSpacings.defaultSpacing * 2),
                Column(children: <Widget>[
                  Text(
                    subtitle,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: AppFonts.subFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ])
              ],
            )));
  }
}
