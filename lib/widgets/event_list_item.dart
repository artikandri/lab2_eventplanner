import 'package:flutter/material.dart';
import 'package:eventplanner/theme/index.dart';

class EventListItem extends StatelessWidget {
  final String title;
  final String subtitle;

  EventListItem({
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppSpacings.defaultSpacing),
      padding: EdgeInsets.all(AppSpacings.defaultSpacing * 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacings.defaultSpacing * 4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white54,
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
