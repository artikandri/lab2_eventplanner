import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:eventplanner/ui/home_2/home_view.dart';
import 'package:eventplanner/ui/home_2/home_presenter.dart';
import 'package:eventplanner/components/index.dart';
import 'package:eventplanner/theme/index.dart';
import 'package:eventplanner/widgets/index.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  String title;

  HomePage(this.presenter, {Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements HomeView {
  @override
  void initState() {
    super.initState();
    this.widget.presenter.homeView = this;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: AppColors.kLightYellow,
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      color: AppColors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: AppSpacings.defaultSpacing * 2, vertical: AppSpacings.defaultSpacing),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('Events for Today'),
                          SizedBox(height: AppSpacings.defaultSpacing),
                          Container(
                            height: 80,
                            width: double.infinity,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                SizedBox(width: 15),
                                EventCard(title: "Test", subtitle: "Test deskripsi", cardColor: AppColors.kDarkBlue),
                                SizedBox(width: 15),
                                EventCard(title: "Test", subtitle: "Test deskripsi", cardColor: AppColors.kDarkBlue),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: AppColors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: AppSpacings.defaultSpacing * 2, vertical: AppSpacings.defaultSpacing),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('Events for Today'),
                          SizedBox(height: AppSpacings.defaultSpacing),
                          Container(
                              height: 400,
                              child: Column(children: <Widget>[
                                Expanded(
                                  // <-- Use Expanded with SizedBox.expand
                                  child: SizedBox.expand(
                                    child: ListView(
                                      scrollDirection: Axis.vertical,
                                      children: <Widget>[
                                        Slidable(
                                          // Specify a key if the Slidable is dismissible.
                                          key: const ValueKey(0),
                                          startActionPane: ActionPane(
                                            motion: const ScrollMotion(),
                                            dismissible: DismissiblePane(onDismissed: () {}),
                                            children: const [
                                              SlidableAction(
                                                // onPressed: doNothing,
                                                backgroundColor: Color(0xFF21B7CA),
                                                foregroundColor: Colors.white,
                                                icon: Icons.share,
                                                label: 'Mark as done',
                                              ),
                                            ],
                                          ),

                                          // The end action pane is the one at the right or the bottom side.
                                          endActionPane: const ActionPane(
                                            motion: ScrollMotion(),
                                            children: [
                                              SlidableAction(
                                                // An action can be bigger than the others.
                                                flex: 2,
                                                // onPressed: doNothing,
                                                backgroundColor: Color(0xFF7BC043),
                                                foregroundColor: Colors.white,
                                                icon: Icons.delete,
                                                label: 'Remove',
                                              ),
                                            ],
                                          ),

                                          // The child of the Slidable is what the user sees when the
                                          // component is not dragged.
                                          child: EventListItem(title: "Test", date: "test", subtitle: "Test deskripsi", eventIcon: Icons.alarm),
                                        ),
                                        SizedBox(width: 15),
                                        EventListItem(title: "Test", date: "test", subtitle: "Test deskripsi", eventIcon: Icons.alarm),
                                        SizedBox(width: 15),
                                        EventListItem(title: "Test", date: "test", subtitle: "Test deskripsi", eventIcon: Icons.alarm),
                                      ],
                                    ),
                                  ),
                                ),
                              ])),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => this.widget.presenter.onAddButtonClicked(context),
        tooltip: 'Create new event',
        child: new Icon(Icons.add),
      ),
    );
  }
}
