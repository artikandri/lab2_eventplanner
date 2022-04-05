import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableListItem extends StatelessWidget {
  final Widget child;
  final Function onMarkAsReadButtonClicked;
  final Function onDeleteButtonClicked;

  SlidableListItem({this.child, this.onMarkAsReadButtonClicked, this.onDeleteButtonClicked});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      // startActionPane: ActionPane(
      //   motion: const ScrollMotion(),
      //   dismissible: DismissiblePane(onDismissed: () {}),
      //   children: [
      //     SlidableAction(
      //       onPressed: onMarkAsReadButtonClicked,
      //       backgroundColor: Color(0xFF21B7CA),
      //       foregroundColor: Colors.white,
      //       icon: Icons.share,
      //       label: 'Mark as done',
      //     ),
      //   ],
      // ),
      // endActionPane: ActionPane(
      //   motion: ScrollMotion(),
      //   children: [
      //     SlidableAction(
      //       // An action can be bigger than the others.
      //       flex: 2,
      //       onPressed: onDeleteButtonClicked,
      //       backgroundColor: Color(0xFF7BC043),
      //       foregroundColor: Colors.white,
      //       icon: Icons.delete,
      //       label: 'Remove',
      //     ),
      //   ],
      // ),
      child: child,
    );
  }
}
