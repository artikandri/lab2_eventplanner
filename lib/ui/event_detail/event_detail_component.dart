import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:eventplanner/ui/event_detail/event_detail_view.dart';
import 'package:eventplanner/ui/event_detail/event_detail_presenter.dart';
import 'package:eventplanner/components/index.dart';
import 'package:eventplanner/theme/index.dart';
import 'package:eventplanner/widgets/index.dart';

class EventDetailPage extends StatefulWidget {
  final EventDetailPresenter presenter;

  String title;

  EventDetailPage(this.presenter, {Key key, this.title}) : super(key: key);

  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> implements EventDetailView {
  @override
  void initState() {
    super.initState();
    this.widget.presenter.eventDetailView = this;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return new Scaffold(
        backgroundColor: AppColors.kLightYellow,
        body: new Center(
            child: new Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          TopContainer(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
            width: width,
            child: Column(
              children: <Widget>[
                BackButton(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Event detail',
                      style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ])));
  }
}
