import 'package:flutter/material.dart';
import 'package:eventplanner/theme/index.dart';

Text subheading(String title) {
  return Text(
    title,
    style: TextStyle(color: AppColors.kDarkPurple, fontSize: AppFonts.headingFontSize, fontWeight: FontWeight.w700, letterSpacing: 1.2),
  );
}
