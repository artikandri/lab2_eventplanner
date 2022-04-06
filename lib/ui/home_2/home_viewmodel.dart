import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class HomeViewModel {
  List _events = [];
  List get events => _events;
  set events(List newEvents) {
    _events = newEvents;
  }


  List get todayEvents() {
    return _events.where((_event) => _event.date.isAfter(DateTime.now().subtract(Duration(days: 1))) ).toList();
  }

  List get eventsByStatus(int eventStatus) {
    return _events.where((_event) => _event.status == eventStatus).toList();
  }

  HomeViewModel();
}
