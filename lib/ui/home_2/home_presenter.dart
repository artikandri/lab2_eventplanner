import 'package:flutter/material.dart';
import 'package:eventplanner/ui/home_2/home_view.dart';
import 'package:eventplanner/ui/home_2/home_viewmodel.dart';
import 'package:eventplanner/ui/create_new_event/create_new_event_component.dart';
import 'package:eventplanner/ui/create_new_event/create_new_event_presenter.dart';

class HomePresenter {
  void onAddButtonClicked(BuildContext context) {}
  VoidCallback onMarkAsReadButtonClicked() {}
  VoidCallback onDeleteButtonClicked() {}

  set homeView(HomeView value) {}
}

class BasicHomePresenter implements HomePresenter {
  HomeViewModel _viewModel;
  HomeView _view;

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
  VoidCallback onMarkAsReadButtonClicked() {}

  @override
  VoidCallback onDeleteButtonClicked() {}
}
