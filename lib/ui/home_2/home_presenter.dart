import 'package:flutter/material.dart';
import 'package:eventplanner/ui/home_2/home_view.dart';
import 'package:eventplanner/ui/home_2/home_viewmodel.dart';
import 'package:eventplanner/ui/create_new_event/create_new_event_component.dart';
import 'package:eventplanner/ui/create_new_event/create_new_event_presenter.dart';

class HomePresenter {
  void onAddButtonClicked() {}

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
  void onAddButtonClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateNewEventPage(new BasicCreateNewEventPresenter(), title: "Create new event")),
    );
  }
}
