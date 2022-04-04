import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eventplanner/theme/index.dart';

import 'package:eventplanner/ui/home/home_presenter.dart';
import 'package:eventplanner/ui/home/home_component.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.kLightYellow,
    statusBarColor: Color(0xffffb969),
  ));

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Event Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: AppColors.kDarkBlue, displayColor: AppColors.kDarkBlue, fontFamily: 'Poppins'),
      ),
      // routes: <String, WidgetBuilder>{
      //   "/create_event": (BuildContext context) => new CreateEventPage(new CreateEventPresenter(), title: "Create Event"),
      // },
      home: new MyHomePage(new BasicHomePresenter(), title: 'Event Planner'),
    );
  }
}
