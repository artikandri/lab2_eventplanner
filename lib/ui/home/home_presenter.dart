import 'package:eventplanner/ui/home/home_viewmodel.dart';
import 'package:eventplanner/ui/home/home_view.dart';
import 'package:eventplanner/utils/shared_prefs_helper.dart';

class HomePresenter {
  void onAddButtonClick() {}
  // void getEventListData() {}
  set homeView(HomeView value) {}
}

class BasicHomePresenter implements HomePresenter {
  HomeViewModel _homeViewModel;
  HomeView _homeView;
  SharedPrefsHelper _sharedPrefsHelper;

  BasicHomePresenter() {
    this._homeViewModel = new HomeViewModel();
    this._sharedPrefsHelper = new SharedPrefsHelper();
  }

  @override
  void onAddButtonClick() {}

  @override
  void getEventListData() {
    // List events = await _sharedPrefsHelper.getListData('events');
  }

  @override
  set homeView(HomeView value) {
    _homeView = value;
  }
}
