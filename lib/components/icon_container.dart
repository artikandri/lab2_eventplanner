import 'package:flutter/material.dart';
import 'package:eventplanner/theme/index.dart';

CircleAvatar iconContainer(icon) {
  return CircleAvatar(
    radius: 20.0,
    backgroundColor: AppColors.kDarkBlue,
    child: Icon(
      icon,
      size: AppSpacings.defaultSpacing * 2,
      color: Colors.white,
    ),
  );
}
