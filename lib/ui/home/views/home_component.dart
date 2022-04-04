import 'package:flutter/material.dart';
import 'package:eventplanner/ui/home/presenter/home_presenter.dart';
import 'package:eventplanner/ui/home/viewmodel/home_viewmodel.dart';
import 'package:eventplanner/ui/home/views/home_view.dart';

class MyHomePage extends StatefulWidget {
  final HomePresenter presenter;

  MyHomePage(this.presenter, {Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements HomeView {
  HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    this.widget.presenter.homeView = this;
  }

  @override
  void refreshHome(HomeViewModel viewModel) {
    setState(() {
      this._viewModel = viewModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              _viewModel.counter.toString(),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => this.widget.presenter.onButton1Clicked(),
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
