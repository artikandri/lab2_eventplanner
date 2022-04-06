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

String getStatusLabelFromValue(int value) {
  String label = "To Do";
  switch (value) {
    case 0:
      label = "To Do";
    case 1:
      label = "In Progress";
    case 2:
      label = "Done";
  }
  return label;
}
