import 'package:flutter/material.dart';
import 'package:eventplanner/theme/index.dart';

class TopContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final EdgeInsets padding;
  final Color containerColor;

  TopContainer({this.height, this.width, this.child, this.padding, this.containerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding != null ? padding : EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          color: containerColor == null ? AppColors.kPaleGray : containerColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
          )),
      height: height,
      width: width,
      child: child,
    );
  }
}
