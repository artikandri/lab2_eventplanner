import 'package:flutter/material.dart';
import 'package:eventplanner/ui/event_detail/event_detail_view.dart';
import 'package:eventplanner/ui/event_detail/event_detail_viewmodel.dart';

class EventDetailPresenter {
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
}
