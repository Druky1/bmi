import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'resuable_card.dart';
import 'constants.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = nonCardColor;
  Color femaleCardColor = nonCardColor;

  Gender? selectedGender;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? CardColor
                          : nonCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                      )),
                ),
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? CardColor
                      : nonCardColor,
                  cardChild: IconContent(
                      icon: FontAwesomeIcons.venus, label: "FEMALE"),
                )),
              ],
            )),
            Expanded(
                child: ReusableCard(
              colour: CardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: labelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: NumberTextStyle),
                      Text(
                        "cm",
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newVal) {
                        setState(() {
                          height = newVal.round();
                        });
                      })
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(child: ReusableCard(colour: CardColor)),
                Expanded(child: ReusableCard(colour: CardColor)),
              ],
            )),
            Container(
              color: BottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: ContainerHeight,
            )
          ],
        ));
  }
}
