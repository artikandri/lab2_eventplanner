import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eventplanner/theme/index.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:eventplanner/ui/home_2/home_presenter.dart';
import 'package:eventplanner/ui/home_2/home_component.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.kWhite,
    statusBarColor: AppColors.kPalePurple,
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
        textTheme: Theme.of(context).textTheme.apply(bodyColor: AppColors.kDarkPurple, displayColor: AppColors.kDarkPurple, fontFamily: 'Poppins'),
      ),
      localizationsDelegates: [
        FormBuilderLocalizations.delegate,
      ],
      // routes: <String, WidgetBuilder>{
      //   "/create_event": (BuildContext context) => new CreateEventPage(new CreateEventPresenter(), title: "Create Event"),
      // },
      home: new HomePage(new BasicHomePresenter(), title: 'Event Planner'),
    );
  }
}
