class HomeViewModel {
  List _events = [];
  List _todayEvents = [];
  List _todoEvents = [];
  List _inprogressEvents = [];
  List _doneEvents = [];

  List get events => _events;
  set events(List newEvents) {
    _events = newEvents;
  }

  List get todayEvents => _todayEvents;
  set todayEvents(List newTodayEvents) {
    _todayEvents = newTodayEvents;
  }

  HomeViewModel();
}
