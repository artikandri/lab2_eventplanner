import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class HomeViewModel {
  List _events = [];

  List get events => _events;
  set events(List newEvents) {
    _events = newEvents;
  }

  HomeViewModel();
}
