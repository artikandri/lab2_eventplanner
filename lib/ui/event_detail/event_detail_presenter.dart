import 'package:flutter/material.dart';
import 'package:eventplanner/ui/event_detail/event_detail_view.dart';
import 'package:eventplanner/ui/event_detail/event_detail_viewmodel.dart';
import 'package:eventplanner/utils/index.dart';

class EventDetailPresenter {
  void setEventData(Map eventData) {}
  void markEventAsRead(Map eventData) {}
  set eventDetailView(EventDetailView value) {}
}

class BasicEventDetailPresenter implements EventDetailPresenter {
  EventDetailViewModel _viewModel;
  EventDetailView _view;

  BasicEventDetailPresenter() {
    this._viewModel = EventDetailViewModel();
  }

  @override
  set eventDetailView(EventDetailView value) {
    _view = value;
  }

  @override
  void setEventData(Map eventData) {
    _viewModel.eventData = eventData;
    _view.setEventData(eventData);
  }

  @override
  void markEventAsRead(Map eventData) {
    Future futureEvents = SharedPrefsHelper().getData("events");
    List events = [];
    futureEvents.then((value) {
      events = value;
    });
    List updatedEvents = events.map((e) {
      e['isRead'] = e['id'] == eventData['id'];
      return e;
    }).toList();
    // SharedPrefsHelper().setData("events", updatedEvents);
    print(futureEvents);
  }
}
