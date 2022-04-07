class EventDetailViewModel {
  static Map<String, dynamic> _eventData = {
    "id": "",
    "name": "",
    "description": "",
    "status": "",
    "datetime": "",
    "date": "",
    "time": "",
    "isRead": false,
    "isDone": false
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
