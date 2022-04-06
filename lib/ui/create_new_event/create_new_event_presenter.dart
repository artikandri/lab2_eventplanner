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
  void saveData(dynamic value) {}

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

  List getPreviousEvents() {
    List _previousEvents = [];
    getEventListData().then((value) {
      if (value != null) value.forEach((item) => _previousEvents.add(item));
    });
    return _previousEvents;
  }

  @override
  void saveData(dynamic formValue) {
    String _name = _viewModel.name != null ? _viewModel.name : formValue.name;
    String _description = _viewModel.description != null ? _viewModel.description : formValue.description;
    int _status = _viewModel.status != null ? _viewModel.status : formValue.status;
    String _date = _viewModel.date != null ? _viewModel.date : formValue.date;
    String _time = _viewModel.time != null ? _viewModel.time : formValue.date;

    List _previousEvents = getPreviousEvents();
    _previousEvents.add({
      "name": _name,
      "description": _description,
      "status": _status,
      "datetime": "${_date} ${_time}",
      "date": _date,
      "time": _time,
      "isRead": false
    });

    print(_previousEvents);
    // SharedPrefsHelper().setData('events', _previousEvents);
  }

  @override
  Future<List> getEventListData() async {
    var items = await SharedPrefsHelper().getData("events");
    return items;
  }
}
