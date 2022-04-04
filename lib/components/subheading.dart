import 'package:flutter/material.dart';
import 'package:eventplanner/theme/colors/light_colors.dart';

Text subheading(String title) {
  return Text(
    title,
    style: TextStyle(color: LightColors.kDarkBlue, fontSize: 20.0, fontWeight: FontWeight.w700, letterSpacing: 1.2),
  );
};
