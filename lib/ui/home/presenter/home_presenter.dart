import 'package:eventplanner/ui/home/viewmodel/home_viewmodel.dart';
import 'package:eventplanner/ui/home/views/home_view.dart';

class HomePresenter {
  void onButton1Clicked() {}
  set homeView(HomeView value) {}
}

class BasicHomePresenter implements HomePresenter {
  HomeViewModel _HomeViewModel;
  HomeView _HomeView;

  BasicHomePresenter() {
    this._HomeViewModel = new HomeViewModel(0);
  }

  @override
  void onButton1Clicked() {
    this._HomeViewModel.counter++;
    this._HomeView.refreshHome(this._HomeViewModel);
  }

  @override
  set homeView(HomeView value) {
    _HomeView = value;
    this._HomeView.refreshHome(this._HomeViewModel);
  }
}
