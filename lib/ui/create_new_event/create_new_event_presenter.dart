import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:eventplanner/utils/index.dart';
import 'package:eventplanner/ui/create_new_event/create_new_event_view.dart';
import 'package:eventplanner/ui/create_new_event/create_new_event_viewmodel.dart';
import 'package:eventplanner/ui/home_2/home_presenter.dart';
import 'package:eventplanner/ui/home_2/home_component.dart';

class CreateNewEventPresenter {
  void onNameChanged(String value) {}
  void onDescriptionChanged(String value) {}
  void onStatusChanged(int value) {}
  void onDateChanged(DateTime value) {}
  void onTimeChanged(DateTime value) {}
  void onTypeChanged(int value) {}

  void saveData(dynamic value, BuildContext context) {}

  set createNewEventView(CreateNewEventView value) {}
}

class BasicCreateNewEventPresenter implements CreateNewEventPresenter {
  CreateNewEventViewModel _viewModel;
  CreateNewEventView _view;

  BasicCreateNewEventPresenter() {
    this._viewModel = CreateNewEventViewModel();
  }

  @override
  set createNewEventView(CreateNewEventView value) {
    _view = value;
  }

  @override
  void onNameChanged(String value) {
    _viewModel.name = value;
  }

  @override
  void onDescriptionChanged(String value) {
    _viewModel.description = value;
  }

  @override
  void onStatusChanged(int value) {
    _viewModel.status = value;
  }

  @override
  void onTypeChanged(int value) {
    _viewModel.type = value;
  }

  @override
  void onDateChanged(DateTime value) {
    String date = DateFormat('yyyy-MM-dd').format(value);
    _viewModel.date = date;
  }

  @override
  void onTimeChanged(DateTime value) {
    String time = DateFormat('Hms').format(value);
    _viewModel.time = time;
  }

  List getPreviousEvents() {
    List _previousEvents = [];
    getEventListData().then((value) {
      if (value != null) value.forEach((item) => _previousEvents.add(item));
    });
    return _previousEvents;
  }

  String nullToString(dynamic value) {
    return value == null ? "" : value;
  }

  @override
  void saveData(dynamic formValue, BuildContext context) {
    String _name = _viewModel.name != null ? _viewModel.name : formValue.name;
    String _description = _viewModel.description != null ? _viewModel.description : formValue['description'];
    int _status = _viewModel.status != null ? _viewModel.status : formValue['status'];
    String _date = _viewModel.date != null ? _viewModel.date : DateFormat('yyyy-MM-dd').format(formValue['date']);
    String _time = _viewModel.time != null ? _viewModel.time : DateFormat('Hms').format(formValue['time']);

    List _previousEvents = getPreviousEvents();
    _previousEvents.add({
      "id": UniqueKey().toString(),
      "name": nullToString(_name),
      "description": nullToString(_description),
      "status": _status,
      "datetime": "${_date} ${_time}",
      "date": _date,
      "time": _time,
      "isRead": false,
    });

    SharedPrefsHelper().setData('events', _previousEvents);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new HomePage(new BasicHomePresenter(), title: "Create new event")),
    );

    var snackBar = SnackBar(content: Text('New event has been added'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<List> getEventListData() async {
    var items = await SharedPrefsHelper().getData("events");
    return items;
  }
}
