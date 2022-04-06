import 'package:flutter/material.dart';
import 'package:eventplanner/theme/colors.dart';

class StatusOption {
  int value;
  String label;

  StatusOption({this.value, this.label});
}

class TimeOption {
  int value;
  String label;

  TimeOption({this.value, this.label});
}

List<StatusOption> statusOptions = [
  StatusOption(value: 0, label: "To Do"),
  StatusOption(value: 1, label: "In Progress"),
  StatusOption(value: 2, label: "Done"),
];

List<TimeOption> timeOptions = [
  TimeOption(value: 0, label: "Today"),
  TimeOption(value: -1, label: "Yesterday"),
  TimeOption(value: 1, label: "Tomorrow"),
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
      color = AppColors.kPaleLightPurple;
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
