class EventDetailViewModel {
  static Map<String, dynamic> _eventData = {
    "id": "",
    "name": "",
    "description": "",
    "status": 0,
    "type": 0,
    "datetime": "",
    "date": "",
    "time": "",
    "isRead": false,
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
