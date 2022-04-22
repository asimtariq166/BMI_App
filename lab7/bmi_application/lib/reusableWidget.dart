import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  ReusableWidget({required this.col, this.childWidget});
  final Color? col;
  final Widget? childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childWidget,
      margin: EdgeInsets.all(15),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: col),
    );
  }
}
