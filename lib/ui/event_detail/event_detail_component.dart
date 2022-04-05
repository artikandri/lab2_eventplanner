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
    return Container();
  }
}
