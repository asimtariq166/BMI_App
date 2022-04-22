import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resultScreen.dart';
import 'constants.dart';
import 'mainScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: kThemeCol, scaffoldBackgroundColor: kThemeCol),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => MainScreen(),
      //   '/second': (context) => ResultScreen()
      //},
      home: MainScreen(),
    );
  }
}
