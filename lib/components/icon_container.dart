import 'package:flutter/material.dart';
import 'package:eventplanner/theme/index.dart';

CircleAvatar iconContainer(icon) {
  return CircleAvatar(
    radius: AppSpacings.defaultSpacing * 3,
    backgroundColor: AppColors.kDarkBlue,
    child: Icon(
      icon,
      size: AppSpacings.defaultSpacing * 2,
      color: Colors.white,
    ),
  );
}
