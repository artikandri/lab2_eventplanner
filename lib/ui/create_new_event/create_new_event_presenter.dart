import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:eventplanner/ui/create_new_event/create_new_event_view.dart';
import 'package:eventplanner/ui/create_new_event/create_new_event_viewmodel.dart';

class CreateNewEventPresenter {
  void onNameChanged(String value) {}
  void onDescriptionChanged(String value) {}
  void onStatusChanged(int value) {}
  void onDateChanged(DateTime value) {}
  void onTimeChanged(DateTime value) {}

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
    print(date);
  }

  @override
  void onTimeChanged(DateTime value) {
    String time = DateFormat('jms').format(value);
    print(time);
  }
}
