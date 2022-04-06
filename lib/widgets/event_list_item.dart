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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 20.0,
          backgroundColor: AppColors.kDarkBlue,
          child: Icon(
            eventIcon,
            size: 15.0,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 10.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black45),
            ),
          ],
        ),
        SizedBox(width: 10.0),
        Text(
          date,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
