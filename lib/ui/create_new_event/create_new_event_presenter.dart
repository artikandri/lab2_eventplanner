import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:eventplanner/utils/index.dart';
import 'package:eventplanner/ui/create_new_event/create_new_event_view.dart';
import 'package:eventplanner/ui/create_new_event/create_new_event_viewmodel.dart';

class CreateNewEventPresenter {
  void onNameChanged(String value) {}
  void onDescriptionChanged(String value) {}
  void onStatusChanged(int value) {}
  void onDateChanged(DateTime value) {}
  void onTimeChanged(DateTime value) {}
  void saveData() {}

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
  void onDateChanged(DateTime value) {
    String date = DateFormat('yyyy-MM-dd').format(value);
    _viewModel.date = date;
  }

  @override
  void onTimeChanged(DateTime value) {
    String time = DateFormat('Hms').format(value);
    _viewModel.time = time;
  }

  @override
  void saveData() {
    List _previousEvents = [];
    getEventListData().then((value) {
      print(value);
      if (value != null) value.forEach((item) => _previousEvents.add(item));
    });
    _previousEvents.add({
      "name": _viewModel.name,
      "description": _viewModel.description,
      "status": _viewModel.status,
      "datetime": "${_viewModel.date} ${_viewModel.time}",
      "date": _viewModel.date,
      "time": _viewModel.time,
      "isRead": false
    });
    SharedPrefsHelper().setData('events', _previousEvents);
  }

  @override
  Future<List> getEventListData() async {
    var items = await SharedPrefsHelper().getData("events");
    return items;
  }
}
