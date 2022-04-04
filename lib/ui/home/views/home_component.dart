import 'package:flutter/material.dart';
import 'package:eventplanner/ui/home/presenter/home_presenter.dart';
import 'package:eventplanner/ui/home/viewmodel/home_viewmodel.dart';
import 'package:eventplanner/ui/home/views/home_view.dart';
import 'package:eventplanner/theme/index.dart';
import 'package:eventplanner/components/index.dart';
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
      backgroundColor: Colors.kLightYellow,
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              subheading('Events'),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => CalendarPage()),
                                  // );
                                },
                                child: calendarIcon(),
                              ),
                            ],
                          ),
                          SizedBox(height: Spacings.defaultSpacing * 2),
                          TaskColumn(
                            icon: Icons.alarm,
                            iconBackgroundColor: Colors.kRed,
                            title: 'To Do',
                            subtitle: '5 tasks now. 1 started',
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TaskColumn(
                            icon: Icons.blur_circular,
                            iconBackgroundColor: Colors.kDarkYellow,
                            title: 'In Progress',
                            subtitle: '1 tasks now. 1 started',
                          ),
                          SizedBox(height: Spacings.defaultSpacing * 2),
                          TaskColumn(
                            icon: Icons.check_circle_outline,
                            iconBackgroundColor: Colors.kBlue,
                            title: 'Done',
                            subtitle: '18 tasks now. 13 started',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: Spacings.defaultSpacing * 2, vertical: Spacings.defaultSpacing),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('Events'),
                          SizedBox(height: Spacings.defaultSpacing),
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: CustomScrollView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  slivers: <Widget>[
                                    SliverPadding(
                                      padding: const EdgeInsets.all(Spacings.defaultSpacing * 2),
                                      sliver: SliverList(
                                        delegate: SliverChildListDelegate(
                                          <Widget>[
                                            EventCard(
                                              cardColor: Colors.kGreen,
                                              title: 'Medical App',
                                              subtitle: '9 hours progress',
                                            ),
                                            EventCard(
                                              cardColor: Colors.kGreen,
                                              title: 'Medical App',
                                              subtitle: '9 hours progress',
                                            ),
                                            EventCard(
                                              cardColor: Colors.kGreen,
                                              title: 'Medical App',
                                              subtitle: '9 hours progress',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
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
