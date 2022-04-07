import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:eventplanner/constants.dart';
import 'package:eventplanner/ui/create_new_event/create_new_event_view.dart';
import 'package:eventplanner/ui/create_new_event/create_new_event_presenter.dart';
import 'package:eventplanner/theme/index.dart';
import 'package:eventplanner/widgets/index.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CreateNewEventPage extends StatefulWidget {
  final CreateNewEventPresenter presenter;
  final String title;

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
    return new Scaffold(
        backgroundColor: AppColors.kWhite,
        body: SafeArea(
            child: Column(children: <Widget>[
          TopContainer(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
            width: width,
            containerColor: AppColors.kPaleGray,
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
                      'Create new event',
                      style: TextStyle(fontSize: AppFonts.titleFontSize, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: new Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      FormBuilderTextField(
                        name: 'name',
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                        onChanged: this.widget.presenter.onNameChanged,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.max(context, 70),
                        ]),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: AppSpacings.defaultSpacing * 1),
                      FormBuilderTextField(
                        name: 'description',
                        decoration: InputDecoration(
                          labelText: 'Description',
                        ),
                        onChanged: this.widget.presenter.onDescriptionChanged,
                        validator: FormBuilderValidators.compose([
                          // FormBuilderValidators.required(context),
                        ]),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: AppSpacings.defaultSpacing * 1),
                      FormBuilderDateTimePicker(
                        name: 'date',
                        decoration: InputDecoration(
                          labelText: 'Appointment Date',
                        ),
                        inputType: InputType.date,
                        initialValue: DateTime.now(),
                        format: DateFormat('yyyy-MM-dd'),
                        onChanged: this.widget.presenter.onDateChanged,
                      ),
                      SizedBox(height: AppSpacings.defaultSpacing * 1),
                      FormBuilderDateTimePicker(
                        name: 'time',
                        onChanged: this.widget.presenter.onTimeChanged,
                        inputType: InputType.time,
                        decoration: InputDecoration(
                          labelText: 'Appointment Time',
                        ),
                        initialTime: TimeOfDay(hour: 8, minute: 0),
                        initialValue: DateTime.now(),
                        // enabled: true,
                      ),
                      SizedBox(height: AppSpacings.defaultSpacing * 1),
                      FormBuilderDropdown(
                        name: 'status',
                        decoration: InputDecoration(
                          labelText: 'Status',
                        ),
                        onChanged: this.widget.presenter.onStatusChanged,
                        initialValue: 0,
                        allowClear: true,
                        hint: Text('Select status'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context)
                        ]),
                        items: statusOptions
                            .map((StatusOption statusOption) => DropdownMenuItem(
                                  value: statusOption.value,
                                  child: Text(statusOption.label),
                                ))
                            .toList(),
                      ),
                      SizedBox(height: AppSpacings.defaultSpacing * 1),
                    ],
                  ),
                ),
              ]),
            ),
          )),
          Container(
            height: 80,
            width: width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _formKey.currentState.save();
                    if (_formKey.currentState.validate()) {
                      this.widget.presenter.saveData(_formKey.currentState.value, context);
                    } else {
                      var snackBar = SnackBar(content: Text('Validation failed'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Container(
                    child: Text(
                      'Create Event',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: AppFonts.bodyFontSize),
                    ),
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                    width: width - 40,
                    decoration: BoxDecoration(
                      color: AppColors.kDarkPurple,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                )
              ],
            ),
          ),
        ])));
  }
}
