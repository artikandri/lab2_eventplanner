import 'package:flutter/material.dart';
import 'package:eventplanner/theme/index.dart';

CircleAvatar iconContainer(icon, backgroundColor, iconColor) {
  return CircleAvatar(
    radius: (AppSpacings.defaultSpacing * 3) + 2,
    backgroundColor: Colors.teal,
    child: CircleAvatar(
      radius: AppSpacings.defaultSpacing * 3,
      backgroundColor: backgroundColor,
      child: Icon(
        icon,
        size: AppSpacings.defaultSpacing * 2,
        color: iconColor,
      ),
    ),
  );
}
