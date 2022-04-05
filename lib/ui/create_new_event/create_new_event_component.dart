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
            width: double.infinity,
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
                        Center(
                          child: new Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                            FormBuilder(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  FormBuilderTextField(
                                    name: 'age',
                                    decoration: InputDecoration(
                                      labelText: 'This value is passed along to the [Text.maxLines] attribute of the [Text] widget used to display the hint text.',
                                    ),
                                    // onChanged: _onChanged,
                                    // valueTransformer: (text) => num.tryParse(text),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(context),
                                      FormBuilderValidators.numeric(context),
                                      FormBuilderValidators.max(context, 70),
                                    ]),
                                    keyboardType: TextInputType.number,
                                  ),
                                  FormBuilderChoiceChip(
                                    name: 'status',
                                    decoration: InputDecoration(
                                      labelText: 'Select event status',
                                    ),
                                    options: [
                                      FormBuilderFieldOption(value: 0, child: Text('To Do')),
                                      FormBuilderFieldOption(value: 1, child: Text('In Progress')),
                                      FormBuilderFieldOption(value: 2, child: Text('Done')),
                                    ],
                                  ),
                                  FormBuilderDateTimePicker(
                                    name: 'date',
                                    // onChanged: _onChanged,
                                    inputType: InputType.time,
                                    decoration: InputDecoration(
                                      labelText: 'Appointment Time',
                                    ),
                                    initialTime: TimeOfDay(hour: 8, minute: 0),
                                    // initialValue: DateTime.now(),
                                    // enabled: true,
                                  ),
                                  FormBuilderDateRangePicker(
                                    name: 'date_range',
                                    firstDate: DateTime(1970),
                                    lastDate: DateTime(2030),
                                    format: DateFormat('yyyy-MM-dd'),
                                    // onChanged: _onChanged,
                                    decoration: InputDecoration(
                                      labelText: 'Date Range',
                                      helperText: 'Helper text',
                                      hintText: 'Hint text',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: MaterialButton(
                                    color: Theme.of(context).colorScheme.secondary,
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      _formKey.currentState.save();
                                      if (_formKey.currentState.validate()) {
                                        print(_formKey.currentState.value);
                                      } else {
                                        print("validation failed");
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: MaterialButton(
                                    color: Theme.of(context).colorScheme.secondary,
                                    child: Text(
                                      "Reset",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      _formKey.currentState.reset();
                                    },
                                  ),
                                ),
                              ],
                            )
                          ]),
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
            // width: width,
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
                  // width: width - 40,
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
