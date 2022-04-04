import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  String _label;

  EventItem(this._label);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20.0),
        color: UIHelper.getColorFromHex("#303876"),
      ),
      child: Text(
        this._label,
        style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      ),
      padding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 0),
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 8, bottom: 8, left: 4, right: 4),
    );
  }
}
