import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eventplanner/theme/colors/light_colors.dart';
import 'package:eventplanner/ui/home/presenter/home_presenter.dart';
import 'package:eventplanner/ui/home/views/home_component.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: LightColors.kLightYellow,
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
        textTheme: Theme.of(context).textTheme.apply(bodyColor: LightColors.kDarkBlue, displayColor: LightColors.kDarkBlue, fontFamily: 'Poppins'),
      ),
      home: new MyHomePage(new BasicHomePresenter(), title: 'Event Planner'),
    );
  }
}
