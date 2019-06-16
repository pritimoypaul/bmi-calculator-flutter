import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'changable_container.dart';
import 'constants.dart';
import 'results_page.dart';

enum Sex {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

Sex sex;
int height = 120;
int weight = 60;
int age = 19;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ChangableContainer(
                    onPressed: () {
                      setState(() {
                        sex = Sex.male;
                      });
                    },
                    colour: sex == Sex.male
                        ? kactivecontainercolor
                        : kinactivecontainercolor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      gender: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ChangableContainer(
                    onPressed: () {
                      setState(() {
                        sex = Sex.female;
                      });
                    },
                    colour: sex == Sex.female
                        ? kactivecontainercolor
                        : kinactivecontainercolor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      gender: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ChangableContainer(
                    colour: kactivecontainercolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: ktextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumbertextStyle,
                            ),
                            Text(
                              'cm',
                              style: ktextStyle,
                            ),
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newvalue) {
                            setState(() {
                              height = newvalue.round();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ChangableContainer(
                    colour: kactivecontainercolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: ktextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumbertextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ChangableContainer(
                    colour: kactivecontainercolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: ktextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumbertextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage()));
            },
            child: Container(
              color: kbottomcontcolor,
              child: Center(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              margin: EdgeInsets.only(top: 10.0),
              height: 80.0,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
