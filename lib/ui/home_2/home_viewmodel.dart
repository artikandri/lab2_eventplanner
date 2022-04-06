class HomeViewModel {
  List _events = [];

  List get events => _events;
  set events(List newEvents) {
    _events = newEvents;
  }

  HomeViewModel();
}
