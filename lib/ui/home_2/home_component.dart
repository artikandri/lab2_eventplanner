import 'package:flutter/material.dart';
import 'package:eventplanner/ui/home_2/home_view.dart';
import 'package:eventplanner/ui/home_2/home_presenter.dart';
import 'package:eventplanner/components/index.dart';
import 'package:eventplanner/theme/index.dart';
import 'package:eventplanner/widgets/index.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;
  final String title;

  HomePage(this.presenter, {Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomeView {
  List _events = [];
  List _todayEvents = [];

  @override
  void initState() {
    super.initState();
    this.widget.presenter.homeView = this;
    this.widget.presenter.getEventListData();
  }

  @override
  String getEventsTaglineByStatus(int eventStatus) {
    List events = _events.where((_event) => _event['status'] == eventStatus).toList();
    int nrOfEvents = events.length;
    return "${nrOfEvents == 0 ? 'No' : nrOfEvents.toString()} events";
  }

  @override
  setEvents(List events) {
    setState(() {
      _events = events;
      _todayEvents = _events.where((_event) => _event['date'].isAfter(DateTime.now().subtract(Duration(days: 1)))).toList();
      print(events);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;

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
                    TopContainer(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
                      width: width,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Welcome',
                                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Container(
                      color: AppColors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: AppSpacings.defaultSpacing * 2),
                          TaskColumn(icon: Icons.alarm, iconBackgroundColor: AppColors.kRed, title: 'To Do', subtitle: getEventsTaglineByStatus(0)),
                          SizedBox(
                            height: AppSpacings.defaultSpacing * 2,
                          ),
                          TaskColumn(icon: Icons.blur_circular, iconBackgroundColor: AppColors.kDarkYellow, title: 'In Progress', subtitle: getEventsTaglineByStatus(1)),
                          SizedBox(height: AppSpacings.defaultSpacing * 2),
                          TaskColumn(icon: Icons.check_circle_outline, iconBackgroundColor: AppColors.kBlue, title: 'Done', subtitle: getEventsTaglineByStatus(2)),
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
                              child: FutureBuilder(
                                  future: this.widget.presenter.getEventListData(),
                                  builder: (context, snapshot) {
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.none:
                                        break;
                                      case ConnectionState.waiting:
                                        return CircularProgressIndicator(
                                          strokeWidth: 2,
                                        );
                                      case ConnectionState.active:
                                        break;
                                      case ConnectionState.done:
                                    }
                                  })),
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
                          SizedBox(height: AppSpacings.defaultSpacing),
                          Container(
                              height: 400,
                              child: Column(children: <Widget>[
                                Expanded(child: () {
                                  if (_events.length > 0) {
                                    return ListView.builder(
                                        itemCount: _events.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (BuildContext context, int index) {
                                          return Container(
                                            height: 50,
                                            child: SlidableListItem(
                                                child: Container(
                                                    width: double.infinity,
                                                    child: InkWell(
                                                      onTap: () {
                                                        this.widget.presenter.onEventListItemTapped(context);
                                                      }, // Handle your callback
                                                      child: EventListItem(title: "Test", date: "test", subtitle: "Test deskripsi", eventIcon: Icons.alarm),
                                                    )),
                                                onMarkAsReadButtonClicked: () {},
                                                onDeleteButtonClicked: () {}),
                                          );
                                        });
                                  }
                                  return Container();
                                }),
                              ])),
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
        onPressed: () => this.widget.presenter.onAddButtonClicked(context),
        tooltip: 'Create new event',
        child: new Icon(Icons.add),
      ),
    );
  }
}
