import 'package:flutter/material.dart';
import 'package:eventplanner/ui/home_2/home_view.dart';
import 'package:eventplanner/ui/home_2/home_viewmodel.dart';

class HomePresenter {
  void onButtonAddClicked() {}

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
}
