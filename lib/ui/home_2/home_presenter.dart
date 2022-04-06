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
  void onMarkAsReadButtonClicked(BuildContext context) {}
  void onDeleteButtonClicked(BuildContext context) {}
  void onEventListItemTapped(BuildContext context) {}
  Future getEventListData() {}
  // void setEvents() {}

  set homeView(HomeView value) {}
}

class BasicHomePresenter implements HomePresenter {
  HomeViewModel _viewModel;
  HomeView _view;
  SharedPrefsHelper _sharedPrefsHelper = SharedPrefsHelper();

  BasicHomePresenter() {
    this._viewModel = HomeViewModel();
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
  void onMarkAsReadButtonClicked(BuildContext context) {}

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
  Future<List> getEventListData() async {
    var events = await SharedPrefsHelper().getData("events");
    print("is ex")
    return events;
  }

  // @override
  // void setEvents(events) {
  //   _viewModel.events = events;
  //   _view.setEvents(events);
  // }
}
