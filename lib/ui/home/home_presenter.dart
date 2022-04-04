import 'package:eventplanner/ui/home/home_viewmodel.dart';
import 'package:eventplanner/ui/home/home_view.dart';
import 'package:eventplanner/utils/shared_prefs_helper.dart';

class HomePresenter {
  void onButton1Clicked() {}
  set homeView(HomeView value) {}
}

class BasicHomePresenter implements HomePresenter {
  HomeViewModel _HomeViewModel;
  HomeView _HomeView;

  BasicHomePresenter() {
    this._HomeViewModel = new HomeViewModel();
  }

  @override
  void onAddButtonClick() {}

  @override
  set homeView(HomeView value) {
    _HomeView = value;
    this._HomeView.refreshHome(this._HomeViewModel);
  }
}
