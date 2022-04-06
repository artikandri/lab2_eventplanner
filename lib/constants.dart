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

IconData getStatusIconFromValue(int value) {
  IconData icon = Icons.alarm;
  switch (value) {
    case 0:
      icon = Icons.alarm;
      break;
    case 1:
      icon = Icons.blur_circular;
      break;
    case 2:
      icon = Icons.check_circle_outline;
      break;
  }
  return icon;
}

Color getStatusColorFromValue(int value, {bool isDarker = false}) {
  Color color = AppColors.kLightGreen;
  switch (value) {
    case 0:
      color = isDarker ? AppColors.kRed : AppColors.kLightRed;
      break;
    case 1:
      color = isDarker ? AppColors.kOrange : AppColors.kLightOrange;
      break;
    case 2:
      color = isDarker ? AppColors.kGreen : AppColors.kLightGreen;
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
