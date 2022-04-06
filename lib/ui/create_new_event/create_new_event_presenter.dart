import 'package:flutter/material.dart';
import 'package:eventplanner/ui/create_new_event/create_new_event_view.dart';
import 'package:eventplanner/ui/create_new_event/create_new_event_viewmodel.dart';

class CreateNewEventPresenter {
  void onNameChanged(String value) {}
  void onDescriptionChanged(String value) {}
  void onStatusChanged(int value) {}

  // void onDateChanged(String value) {}
  // void onTimeChanged(String value) {}

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
}
