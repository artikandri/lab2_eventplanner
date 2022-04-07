import 'package:flutter/material.dart';
import 'package:eventplanner/ui/event_detail/event_detail_view.dart';
import 'package:eventplanner/ui/event_detail/event_detail_presenter.dart';
import 'package:eventplanner/theme/index.dart';
import 'package:eventplanner/widgets/index.dart';
import 'package:eventplanner/constants.dart';

class EventDetailPage extends StatefulWidget {
  final EventDetailPresenter presenter;

  String title;

  EventDetailPage(this.presenter, {Key key, this.title}) : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> implements EventDetailView {
  Map _eventData;

  @override
  void initState() {
    super.initState();
    this.widget.presenter.eventDetailView = this;
  }

  @override
  void setEventData(Map eventData) {
    setState(() {
      _eventData = eventData;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final eventData = ModalRoute.of(context).settings.arguments;

    this.widget.presenter.setEventData(eventData);
    this.widget.presenter.markEventAsRead(eventData);

    return new Scaffold(
        backgroundColor: AppColors.kLightYellow,
        body: new Center(
            child: new Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          TopContainer(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
            width: width,
            containerColor: getTypeDataFromValue(_eventData['type']).color,
            child: Column(
              children: <Widget>[
                MyBackButton(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _eventData['name'],
                      style: TextStyle(fontSize: AppFonts.headingFontSize, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Due on ${_eventData['datetime']}",
                      style: TextStyle(fontSize: AppFonts.bodyFontSize, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Column(children: <Widget>[
            Text(
              _eventData['description'],
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
            ),
            Text(
              _eventData['date'],
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
            ),
            Text(
              _eventData['time'],
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
            ),
            Text(
              getStatusLabelFromValue(_eventData['status']),
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
            ),
          ])
        ])));
  }
}
