import 'package:flutter/material.dart';
import 'package:eventplanner/ui/home_2/home_view.dart';
import 'package:eventplanner/ui/home_2/home_presenter.dart';
import 'package:eventplanner/components/index.dart';
import 'package:eventplanner/theme/index.dart';
import 'package:eventplanner/widgets/index.dart';
import 'package:eventplanner/utils/index.dart';
import 'package:eventplanner/constants.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;
  final String title;

  HomePage(this.presenter, {Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomeView {
  Future _futureEvents;

  List _events = [];
  List _todayEvents = [];
  List _todoEvents = [];
  List _inprogressEvents = [];
  List _doneEvents = [];

  @override
  void initState() {
    super.initState();
    this.widget.presenter.homeView = this;
    _futureEvents = this.widget.presenter.getEventFutureListData();
    // _futureEvents.then((value) {
    //   setEventsData(value);
    // });
  }

  @override
  void setEventsData(List events) {
    setState(() {
      _events = events;
      _todayEvents = _events.where((_event) {
        DateTime dt = DateTime.parse(_event['datetime']);
        return dt.isToday();
      }).toList();

      _todoEvents = _events.where((_event) => _event['status'] == 0).toList();
      _inprogressEvents = _events.where((_event) => _event['status'] == 1).toList();
      _doneEvents = _events.where((_event) => _event['status'] == 2).toList();
    });
  }

  @override
  String getEventsTaglineByStatus(int eventStatus) {
    List events = _events.where((_event) => int.parse(_event['status']) == eventStatus).toList();
    int nrOfEvents = events.length;
    return "${nrOfEvents == 0 ? 'No' : nrOfEvents.toString()} events";
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
                      containerColor: AppColors.kPaleGray,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'My Events',
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
                        child: FutureBuilder(
                            future: _futureEvents,
                            builder: (context, snapshot) {
                              return Column(
                                children: <Widget>[
                                  SizedBox(height: AppSpacings.defaultSpacing * 2),
                                  TaskColumn(icon: getStatusIconFromValue(0), iconBackgroundColor: getStatusColorFromValue(0), title: 'To Do', nrOfEvents: _todoEvents.length),
                                  SizedBox(
                                    height: AppSpacings.defaultSpacing * 2,
                                  ),
                                  TaskColumn(icon: getStatusIconFromValue(1), iconBackgroundColor: getStatusColorFromValue(1), title: 'In Progress', nrOfEvents: _inprogressEvents.length),
                                  SizedBox(
                                    height: AppSpacings.defaultSpacing * 2,
                                  ),
                                  TaskColumn(icon: getStatusIconFromValue(2), iconBackgroundColor: getStatusColorFromValue(2), title: 'Done', nrOfEvents: _doneEvents.length),
                                ],
                              );
                            })),
                    Container(
                      width: double.infinity,
                      color: AppColors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: AppSpacings.defaultSpacing * 2, vertical: AppSpacings.defaultSpacing),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('Events for'),
                          SizedBox(height: AppSpacings.defaultSpacing),
                          Container(
                              height: 80,
                              width: double.infinity,
                              child: FutureBuilder(
                                  future: _futureEvents,
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
                                        if (_todayEvents.length > 0) {
                                          return Container(
                                              child: ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: _todayEvents.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return Column(children: <Widget>[
                                                      EventCard(title: _todayEvents[index]['name'], subtitle: _todayEvents[index]['description'], cardColor: AppColors.kDarkBlue),
                                                      SizedBox(width: 15)
                                                    ]);
                                                  }));
                                        }
                                        return Container(child: Text("No events registered today"));
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
                          subheading('All events'),
                          SizedBox(height: AppSpacings.defaultSpacing),
                          Container(
                              height: 400,
                              child: Column(children: <Widget>[
                                Expanded(
                                  child: Container(
                                      child: FutureBuilder(
                                          future: _futureEvents,
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
                                                if (_events != null) {
                                                  return Container(
                                                    child: ListView.builder(
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
                                                                      this.widget.presenter.onEventListItemTapped(context, _events[index]);
                                                                    },
                                                                    child: EventListItem(title: _events[index]['name'], date: _events[index]['date'], subtitle: getStatusLabelFromValue(_events[index]['status']), eventIcon: getStatusIconFromValue(_events[index]['status'])),
                                                                  )),
                                                              onMarkAsReadButtonClicked: () {
                                                                this.widget.presenter.onMarkAsReadButtonClicked(context, _events[index]);
                                                              },
                                                              onDeleteButtonClicked: () {
                                                                this.widget.presenter.onDeleteButtonClicked(context, _events[index]);
                                                              },
                                                            ),
                                                          );
                                                        }),
                                                  );
                                                }
                                                return Container(child: Text("No events registered"));
                                            }
                                          })),
                                ),
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
