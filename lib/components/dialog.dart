import 'package:flutter/material.dart';

Future<void> showAlertDialog(BuildContext context, String title, String description, VoidCallback onApprove, VoidCallback onCancel) async {
  bool isConfirmed = false;
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
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
              isConfirmed = false;
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              isConfirmed = true;
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
