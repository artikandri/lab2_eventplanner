import 'package:flutter/material.dart';
import 'package:eventplanner/ui/event_detail/event_detail_view.dart';
import 'package:eventplanner/ui/event_detail/event_detail_presenter.dart';
import 'package:eventplanner/theme/index.dart';
import 'package:eventplanner/components/icon_container.dart';
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

  bool isEmpty(String text) {
    return text != null || text != "";
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final eventData = ModalRoute.of(context).settings.arguments;

    this.widget.presenter.setEventData(eventData);
    this.widget.presenter.markEventAsRead(eventData);

    print(_eventData['description']);
    print(isEmpty(_eventData['description']));
    return new Scaffold(
        backgroundColor: AppColors.kWhite,
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
                  height: AppSpacings.defaultSpacing * 4,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
                      Text(
                        _eventData['name'],
                        style: TextStyle(fontSize: AppFonts.headingFontSize, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: AppSpacings.defaultSpacing,
                      ),
                      Text(
                        "Due on ${_eventData['datetime']}",
                        style: TextStyle(fontSize: AppFonts.bodyFontSize, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: AppSpacings.defaultSpacing * 2,
                      ),
                      Row(children: <Widget>[
                        Container(
                          child: Text(
                            getTypeDataFromValue(_eventData['type'].label),
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: AppFonts.bodyFontSize),
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.kDarkPurple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Text(
                          getStatusLabelFromValue(_eventData['status']),
                          style: TextStyle(fontSize: AppFonts.subFontSize, fontWeight: FontWeight.w600),
                        ),
                      ])
                    ]),
                    Spacer(),
                    iconContainer(getTypeDataFromValue(_eventData['type']).icon, getTypeDataFromValue(_eventData['type']).color, AppColors.kDarkPurple, isBordered: true, borderColor: AppColors.kDarkPurple),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppSpacings.defaultSpacing * 2,
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Column(children: <Widget>[
              Row(children: <Widget>[
                iconContainer(Icons.format_align_center, AppColors.transparent, getTypeDataFromValue(_eventData['type']).color),
                Text(
                  !isEmpty(_eventData['description']) ? _eventData['description'] : "No description given",
                  style: TextStyle(fontSize: AppFonts.bodyFontSize, fontWeight: FontWeight.w300),
                ),
              ]),
            ])
          ]),
          SizedBox(
            height: AppSpacings.defaultSpacing,
          ),
          Row(children: <Widget>[
            iconContainer(Icons.event, AppColors.transparent, getTypeDataFromValue(_eventData['type']).color),
            Text(
              _eventData['date'],
              style: TextStyle(fontSize: AppFonts.bodyFontSize, fontWeight: FontWeight.w300),
            ),
          ]),
          SizedBox(
            height: AppSpacings.defaultSpacing,
          ),
          Row(children: <Widget>[
            iconContainer(Icons.schedule, AppColors.transparent, getTypeDataFromValue(_eventData['type']).color),
            Text(
              _eventData['time'],
              style: TextStyle(fontSize: AppFonts.bodyFontSize, fontWeight: FontWeight.w300),
            ),
          ]),
        ])));
  }
}
