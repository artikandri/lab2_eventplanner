import 'package:flutter/material.dart';
import 'package:eventplanner/ui/home/presenter/home_presenter.dart';
import 'package:eventplanner/ui/home/viewmodel/home_viewmodel.dart';
import 'package:eventplanner/ui/home/views/home_view.dart';
import 'package:eventplanner/components/index.dart';
import 'package:eventplanner/theme/index.dart';
import 'package:eventplanner/widgets/index.dart';

class MyHomePage extends StatefulWidget {
  final HomePresenter presenter;

  MyHomePage(this.presenter, {Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements HomeView {
  HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    this.widget.presenter.homeView = this;
  }

  @override
  void refreshHome(HomeViewModel viewModel) {
    setState(() {
      this._viewModel = viewModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return new Scaffold(
      backgroundColor: AppColors.kLightYellow,
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: AppColors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('Events'),
                            ],
                          ),
                          SizedBox(height: AppSpacings.defaultSpacing * 2),
                          TaskColumn(
                            icon: Icons.alarm,
                            iconBackgroundColor: AppColors.kRed,
                            title: 'To Do',
                            subtitle: '5 tasks now. 1 started',
                          ),
                          SizedBox(
                            height: AppSpacings.defaultSpacing * 2,
                          ),
                          TaskColumn(
                            icon: Icons.blur_circular,
                            iconBackgroundColor: AppColors.kDarkYellow,
                            title: 'In Progress',
                            subtitle: '1 tasks now. 1 started',
                          ),
                          SizedBox(height: AppSpacings.defaultSpacing * 2),
                          TaskColumn(
                            icon: Icons.check_circle_outline,
                            iconBackgroundColor: AppColors.kBlue,
                            title: 'Done',
                            subtitle: '18 tasks now. 13 started',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: AppColors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: AppSpacings.defaultSpacing * 2, vertical: AppSpacings.defaultSpacing),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('Events for Today'),
                          SizedBox(height: AppSpacings.defaultSpacing),
                          Container(
                            height: 80,
                            width: double.infinity,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                EventCard(title: "Test", subtitle: "Test deskripsi", cardColor: AppColors.kDarkBlue),
                                SizedBox(width: 15),
                                EventCard(title: "Test", subtitle: "Test deskripsi", cardColor: AppColors.kDarkBlue),
                                SizedBox(width: 15),
                                EventCard(title: "Test", subtitle: "Test deskripsi", cardColor: AppColors.kDarkBlue),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: AppColors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: AppSpacings.defaultSpacing * 2, vertical: AppSpacings.defaultSpacing),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('Events for Today'),
                          SizedBox(height: AppSpacings.defaultSpacing),
                          Container(
                            height: 400,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                EventListItem(title: "Test", subtitle: "Test deskripsi"),
                                SizedBox(width: 15),
                                EventListItem(title: "Test", subtitle: "Test deskripsi"),
                                SizedBox(width: 15),
                                EventListItem(title: "Test", subtitle: "Test deskripsi"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => this.widget.presenter.onButton1Clicked(),
        tooltip: 'Create new event',
        child: new Icon(Icons.add),
      ),
    );
  }
}
