class CreateNewEventViewModel {
  // set data

  String _name = "";
  String _description = "";
  int _status;
  bool _isRead = false;
  int _date;

//   final toUTC = DateTime(selectedDate.year, selectedDate.month, selectedDate.year,
// selectedTime.hour, selectedTime.minute);
  String get name => _name;
  void set name(String newName) {
    _name = newName;
  }

  String get description => _description;
  void set description(String newDescription) {
    _description = newDescription;
  }

  int get status => _status;
  void set status(int newStatus) {
    _status = newStatus;
  }

  set date(int newDate) {
    _date = newDate;
  }

  CreateNewEventViewModel();
}
