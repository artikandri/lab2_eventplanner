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
                                Slidable(
                                  // Specify a key if the Slidable is dismissible.
                                  key: const ValueKey(0),

                                  // The start action pane is the one at the left or the top side.
                                  startActionPane: ActionPane(
                                    // A motion is a widget used to control how the pane animates.
                                    motion: const ScrollMotion(),

                                    // A pane can dismiss the Slidable.
                                    dismissible: DismissiblePane(onDismissed: () {}),

                                    // All actions are defined in the children parameter.
                                    children: const [
                                      // A SlidableAction can have an icon and/or a label.
                                      SlidableAction(
                                        onPressed: doNothing,
                                        backgroundColor: Color(0xFFFE4A49),
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                        label: 'Delete',
                                      ),
                                      SlidableAction(
                                        onPressed: doNothing,
                                        backgroundColor: Color(0xFF21B7CA),
                                        foregroundColor: Colors.white,
                                        icon: Icons.share,
                                        label: 'Share',
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
                                        onPressed: doNothing,
                                        backgroundColor: Color(0xFF7BC043),
                                        foregroundColor: Colors.white,
                                        icon: Icons.archive,
                                        label: 'Archive',
                                      ),
                                      SlidableAction(
                                        onPressed: doNothing,
                                        backgroundColor: Color(0xFF0392CF),
                                        foregroundColor: Colors.white,
                                        icon: Icons.save,
                                        label: 'Save',
                                      ),
                                    ],
                                  ),

                                  // The child of the Slidable is what the user sees when the
                                  // component is not dragged.
                                  child: EventCard(title: "Test", subtitle: "Test deskripsi", cardColor: AppColors.kDarkBlue),
                                ),
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
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                EventListItem(title: "Test", subtitle: "Test deskripsi", eventIcon: Icons.alarm),
                                SizedBox(width: 15),
                                EventListItem(title: "Test", subtitle: "Test deskripsi", eventIcon: Icons.alarm),
                                SizedBox(width: 15),
                                EventListItem(title: "Test", subtitle: "Test deskripsi", eventIcon: Icons.alarm),
                              ],
                            ),
                          ),
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
