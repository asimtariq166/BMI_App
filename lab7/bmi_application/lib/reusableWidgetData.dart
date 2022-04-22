import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableWidgetData extends StatelessWidget {
  ReusableWidgetData({required this.icon, this.label});

  final IconData icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icon,
        size: 80,
        color: Colors.white,
      ),
      SizedBox(height: 15),
      Text(
        "$label",
        style: kLblTxtStyle,
      )
    ]);
  }
}
