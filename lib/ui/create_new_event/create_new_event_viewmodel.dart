class CreateNewEventViewModel {
  // set data

  String _name = "";
  String _description = "";
  bool _isRead = false;
  int _date;
  int _status = 0;

//   final toUTC = DateTime(selectedDate.year, selectedDate.month, selectedDate.year,
// selectedTime.hour, selectedTime.minute);
  get name => _name;
  set name(String newName) {
    _name = newName;
  }

  set description(String newDescription) {
    _description = newDescription;
  }

  set date(int newDate) {
    _date = newDate;
  }

  set status(int newStatus) {
    _status = newStatus;
  }

  CreateNewEventViewModel();
}
