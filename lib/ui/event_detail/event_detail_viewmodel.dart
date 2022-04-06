class EventDetailViewModel {
  static Map<String, String> _eventData = {
    "id": "",
    "name": "",
    "description": "",
    "status": "",
    "datetime": "",
    "date": "",
    "time": "",
    "isRead": false
  };

  Map get eventData => _eventData;
  set eventData(Map newEventData) {
    _eventData = {
      ...eventData,
      ...newEventData
    };
  }

  EventDetailViewModel();
}
