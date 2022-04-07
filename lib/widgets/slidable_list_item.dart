import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:eventplanner/theme/colors.dart';

class SlidableListItem extends StatelessWidget {
  final Widget child;
  final VoidCallback onMarkAsDoneButtonClicked;
  final VoidCallback onDeleteButtonClicked;

  SlidableListItem({this.child, this.onMarkAsDoneButtonClicked, this.onDeleteButtonClicked});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext context) {
              onMarkAsDoneButtonClicked();
            },
            backgroundColor: AppColors.kPalePurple,
            foregroundColor: Colors.white,
            icon: Icons.done,
            label: 'Mark as done',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext context) {
              onDeleteButtonClicked();
            },
            backgroundColor: AppColors.kRed,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: child,
    );
  }
}
