import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:eventplanner/ui/create_new_event/create_new_event_view.dart';
import 'package:eventplanner/ui/create_new_event/create_new_event_presenter.dart';
import 'package:eventplanner/components/index.dart';
import 'package:eventplanner/theme/index.dart';
import 'package:eventplanner/widgets/index.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CreateNewEventPage extends StatefulWidget {
  final CreateNewEventPresenter presenter;

  String title;

  CreateNewEventPage(this.presenter, {Key key, this.title}) : super(key: key);

  @override
  _CreateNewEventPageState createState() => _CreateNewEventPageState();
}

class _CreateNewEventPageState extends State<CreateNewEventPage> implements CreateNewEventView {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    this.widget.presenter.createNewEventView = this;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var downwardIcon = Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    );

    return new Scaffold(
        backgroundColor: AppColors.kLightYellow,
        body: SafeArea(
            child: Column(children: <Widget>[
          TopContainer(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
            width: width,
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
                      'Create new task',
                      style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Textbox(label: 'Title'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Textbox(
                            label: 'Date',
                            icon: downwardIcon,
                          ),
                        ),
                        // calendarIcon(),
                      ],
                    )
                  ],
                ))
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: Textbox(
                      label: 'Start Time',
                      icon: downwardIcon,
                    )),
                    SizedBox(width: 40),
                    Expanded(
                      child: Textbox(
                        label: 'End Time',
                        icon: downwardIcon,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Textbox(
                  label: 'Description',
                  minLines: 3,
                  maxLines: 3,
                ),
              ],
            ),
          )),
          Container(
            height: 80,
            width: width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Text(
                    'Create Task',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                  width: width - 40,
                  decoration: BoxDecoration(
                    color: AppColors.kBlue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ],
            ),
          ),
        ])));
  }
}
