import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'resultScreen.dart';
import 'reusableWidget.dart';
import 'reusableWidgetData.dart';
import 'calculator.dart';

enum Gender { male, female }

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color maleCol = kInActiveCardCol;
  Color femaleCol = kInActiveCardCol;
  int weight = 60;
  int height = 160;
  int age = 20;

  void updateColor(Gender gender) {
    if (gender == Gender.male) {
      if (maleCol == kInActiveCardCol) {
        maleCol = kActiveCardCol;
        femaleCol = kInActiveCardCol;
      } else {
        maleCol = kInActiveCardCol;
        femaleCol = kActiveCardCol;
      }
    } else {
      if (femaleCol == kInActiveCardCol) {
        femaleCol = kActiveCardCol;
        maleCol = kInActiveCardCol;
      } else {
        femaleCol = kInActiveCardCol;
        maleCol = kActiveCardCol;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI CALCULATOR")),
        backgroundColor: kThemeCol,
      ),
      body: Column(children: [
        Expanded(
            child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    updateColor(Gender.male);
                  });
                },
                child: ReusableWidget(
                    col: maleCol,
                    childWidget: ReusableWidgetData(
                        icon: FontAwesomeIcons.mars, label: "MALE")),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    updateColor(Gender.female);
                  });
                },
                child: ReusableWidget(
                    col: femaleCol,
                    childWidget: ReusableWidgetData(
                        icon: FontAwesomeIcons.venus, label: "FEMALE")),
              ),
            ),
          ],
        )),
        Expanded(
            child: ReusableWidget(
          col: kInActiveCardCol,
          childWidget: Column(children: [
            Text(
              "HEIGHT",
              style: kLblTxtStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(height.toString(), style: kNumTxtStyle),
                Text(
                  'cm',
                  style: kLblTxtStyle,
                )
              ],
            ),
            Slider(
              value: height.toDouble(),
              thumbColor: Colors.pink,
              min: 120,
              max: 220,
              activeColor: Colors.white,
              inactiveColor: Color.fromARGB(221, 75, 75, 75),
              onChanged: (double newVal) {
                setState(() {
                  height = newVal.round();
                });
              },
            )
          ]),
        )),
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: ReusableWidget(
              col: kInActiveCardCol,
              childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("WEIGHT", style: kLblTxtStyle),
                    Text(
                      weight.toString(),
                      style: kNumTxtStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              weight = weight + 1;
                            });
                          },
                          backgroundColor: kActiveCardCol,
                          child: Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.black,
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              if (weight > 0) {
                                weight = weight - 1;
                              }
                            });
                          },
                          backgroundColor: kActiveCardCol,
                          child: Icon(
                            FontAwesomeIcons.minus,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ]),
            )),
            Expanded(
                child: ReusableWidget(
              col: kInActiveCardCol,
              childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("AGE", style: kLblTxtStyle),
                    Text(
                      age.toString(),
                      style: kNumTxtStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              age = age + 1;
                            });
                          },
                          backgroundColor: kActiveCardCol,
                          child: Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.black,
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              if (age > 0) {
                                age = age - 1;
                              }
                            });
                          },
                          backgroundColor: kActiveCardCol,
                          child: Icon(
                            FontAwesomeIcons.minus,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ]),
            )),
          ],
        )),
        FlatButton(
          onPressed: (() {
            Calculator calc = new Calculator(height, weight);
            calc.calcBmi();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultScreen(calc: calc)));
          }),
          child: Container(
              width: double.infinity,
              height: 38,
              //color: kBottomContCol,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kBottomContCol),
              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Center(
                  child: Text(
                "CALCULATE YOUR BMI",
                style: TextStyle(color: Colors.white),
              ))),
        )
      ]),
    );
  }
}
