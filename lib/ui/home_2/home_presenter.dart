import 'package:flutter/material.dart';
import 'package:eventplanner/utils/index.dart';
import 'package:eventplanner/ui/home_2/home_view.dart';
import 'package:eventplanner/ui/home_2/home_viewmodel.dart';
import 'package:eventplanner/ui/create_new_event/create_new_event_component.dart';
import 'package:eventplanner/ui/create_new_event/create_new_event_presenter.dart';
import 'package:eventplanner/ui/event_detail/event_detail_component.dart';
import 'package:eventplanner/ui/event_detail/event_detail_presenter.dart';

class HomePresenter {
  void onAddButtonClicked(BuildContext context) {}
  void onMarkAsReadButtonClicked(dynamic eventData) {}
  void onDeleteButtonClicked(BuildContext context) {}
  void onEventListItemTapped(BuildContext context) {}
  Future<List> getEventFutureListData() {}
  List getEventListData() {}

  set homeView(HomeView value) {}
}

class BasicHomePresenter implements HomePresenter {
  HomeViewModel _viewModel;
  HomeView _view;

  BasicHomePresenter() {
    this._viewModel = HomeViewModel();
    this._view = HomeView();
  }

  @override
  set homeView(HomeView value) {
    _view = value;
  }

  @override
  void onAddButtonClicked(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new CreateNewEventPage(new BasicCreateNewEventPresenter(), title: "Create new event")),
    );
  }

  @override
  void onMarkAsReadButtonClicked(dynamic eventData) {}

  @override
  void onDeleteButtonClicked(BuildContext context) {}

  @override
  void onEventListItemTapped(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new EventDetailPage(new BasicEventDetailPresenter(), title: "Event detail")),
    );
  }

  @override
  Future<List> getEventFutureListData() async {
    // await SharedPrefsHelper().setData("events", "");
    var events = await SharedPrefsHelper().getData("events");
    return events;
  }

  List getEventListData() {
    Future _futureEvents = getEventFutureListData();
    List _events;
    _futureEvents.then((value) {
      _events = value;
    });
    return _events;
  }
}
