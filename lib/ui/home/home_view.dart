import 'package:eventplanner/ui/home/home_viewmodel.dart';

class HomeView {
  HomeViewModel _viewModel;

  HomeView() {
    this._viewModel = HomeViewModel();
  }

  void setEventsData(List events) {
    _viewModel.events = events;
  }

  getEventsData() {
    return _viewModel.events;
  }
}
