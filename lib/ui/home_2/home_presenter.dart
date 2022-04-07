import 'package:flutter/material.dart';
import 'package:eventplanner/utils/index.dart';
import 'package:eventplanner/components/dialog.dart';
import 'package:eventplanner/ui/home_2/home_view.dart';
import 'package:eventplanner/ui/home_2/home_viewmodel.dart';
import 'package:eventplanner/ui/create_new_event/create_new_event_component.dart';
import 'package:eventplanner/ui/create_new_event/create_new_event_presenter.dart';
import 'package:eventplanner/ui/event_detail/event_detail_component.dart';
import 'package:eventplanner/ui/event_detail/event_detail_presenter.dart';

class HomePresenter {
  void onAddButtonClicked(BuildContext context) {}
  void onMarkAsDoneButtonClicked(BuildContext context, dynamic eventData) {}
  void onDeleteButtonClicked(BuildContext context, dynamic eventData) {}
  void onEventListItemTapped(BuildContext context, dynamic eventData) {}
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

  markEventAsDone(eventData) {
    List updatedEvents = _viewModel.events.map((e) {
      e['status'] = e['id'] == eventData['id'] ? 2 : e['status'];

      return e;
    }).toList();
    SharedPrefsHelper().setData("events", updatedEvents);
    _viewModel.events = updatedEvents;
    _view.setEventsData(updatedEvents);
  }

  deleteEvent(eventData) {
    List updatedEvents = _viewModel.events.where((e) => e['id'] != eventData['id']).toList();
    SharedPrefsHelper().setData("events", updatedEvents);

    _viewModel.events = updatedEvents;
    _view.setEventsData(updatedEvents);
  }

  @override
  void onMarkAsDoneButtonClicked(BuildContext context, dynamic eventData) {
    var snackBar = SnackBar(content: Text('Event marked as done'));
    showAlertDialog(context, "Warning", "Are you sure you want to mark this event as done?").then((value) {
      if (value) {
        markEventAsDone(eventData);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  @override
  void onDeleteButtonClicked(BuildContext context, dynamic eventData) {
    showAlertDialog(context, "Warning", "Are you sure you want to delete this event?").then((value) {
      if (value) {
        deleteEvent(eventData);
      }
    });
  }

  @override
  void onEventListItemTapped(BuildContext context, dynamic eventData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => new EventDetailPage(
          new BasicEventDetailPresenter(),
          title: "Event detail",
        ),
        settings: RouteSettings(
          arguments: eventData,
        ),
      ),
    );
  }

  @override
  Future<List> getEventFutureListData() async {
    await SharedPrefsHelper().setData("events", "");
    var _futureEvents = await SharedPrefsHelper().getData("events");
    _viewModel.events = _futureEvents;
    _view.setEventsData(_futureEvents);
    return _futureEvents;
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
