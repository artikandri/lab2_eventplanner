class CreateNewEventViewModel {
  // set data

  String _name;
  String _description;
  int _status;
  int _type;

  String _date;
  String _time;

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

  int get type => _type;
  void set type(int newType) {
    _type = newType;
  }

  String get date => _date;
  set date(String newDate) {
    _date = newDate;
  }

  String get time => _time;
  set time(String newTime) {
    _time = newTime;
  }

  CreateNewEventViewModel();
}
