import 'package:flutter/material.dart';

Future<void> showAlertDialog(BuildContext context, String title, String description, VoidCallback onApprove, VoidCallback onCancel) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
            child: ListBody(
          children: <Widget>[
            Text(description)
          ],
        )),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
              onCancel();
            },
          ),
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
              onApprove();
            },
          ),
        ],
      );
    },
  );
}
