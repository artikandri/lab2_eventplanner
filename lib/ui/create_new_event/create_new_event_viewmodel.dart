class CreateNewEventViewModel {
  // set data

  String _name = "";
  String _description = "";
  bool _isRead = false;
  int _date;
  int _status = 0;

//   final toUTC = DateTime(selectedDate.year, selectedDate.month, selectedDate.year,
// selectedTime.hour, selectedTime.minute);

  set name(String newName) {
    _name = newName;
  }

  set description(String newDescription) {
    _description = newDescription;
  }

  set date(String newDate) {
    _date = newDate;
  }

  set status(String newStatus) {
    _status = newStatus;
  }

  CreateNewEventViewModel();
}
