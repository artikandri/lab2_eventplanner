import 'package:flutter/material.dart';
import 'package:eventplanner/theme/colors.dart';

class StatusOption {
  int value;
  String label;

  StatusOption({this.value, this.label});
}

List<StatusOption> statusOptions = [
  StatusOption(value: 0, label: "To Do"),
  StatusOption(value: 1, label: "In Progress"),
  StatusOption(value: 2, label: "Done"),
];

Color getStatusIconFromValue(int value) {}

Color getStatusColorFromValue(int value) {
  Color color = AppColors.kLightGreen;
  switch (value) {
    case 0:
      color = AppColors.kLightRed;
      break;
    case 1:
      color = AppColors.kLightOrange;
      break;
    case 2:
      color = AppColors.kLightPurple;
      break;
  }
  return color;
}

String getStatusLabelFromValue(int value) {
  String label = "To Do";
  switch (value) {
    case 0:
      label = "To Do";
      break;
    case 1:
      label = "In Progress";
      break;
    case 2:
      label = "Done";
      break;
  }
  return label;
}
