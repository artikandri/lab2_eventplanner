import 'package:flutter/material.dart';
import 'package:eventplanner/theme/colors/light_colors.dart';

CircleAvatar calendarIcon() {
  return CircleAvatar(
    radius: 25.0,
    backgroundColor: LightColors.kGreen,
    child: Icon(
      Icons.calendar_today,
      size: 20.0,
      color: Colors.white,
    ),
  );
}
