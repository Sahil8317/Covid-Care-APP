import 'package:flutter/material.dart';
import 'package:covid19app/constants.dart';

class WashHandsPage extends StatefulWidget {
  @override
  _WashHandsPageState createState() => _WashHandsPageState();
}

class _WashHandsPageState extends State<WashHandsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8),
                height: 260.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 8),
                          blurRadius: 24,
                          color: kActiveShadowColor),
                    ],
                    gradient: LinearGradient(colors: [
                      Color(0xFF3383CD).withOpacity(0.7),
                      Color(0xFF11249F).withOpacity(0.30),
                    ]),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/washhandpage.png'),
                        alignment: Alignment.bottomLeft)),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'WASH HANDS \n STAY SAFE!',
                    style: kHeadingTextStyle.copyWith(fontSize: 26),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              instructionRow(
                ImageShown: 'assets/images/step1.png',
                instruction:
                    '1  Apply a palmful of the Sanitizer in a cupped hand,covering all surfaces.',
              ),
              SizedBox(
                height: 20.0,
              ),
              instructionRow(
                ImageShown: 'assets/images/step2.png',
                instruction: '2  Rub hands palm to palm.',
              ),
              SizedBox(
                height: 20.0,
              ),
              instructionRow(
                ImageShown: 'assets/images/step3.png',
                instruction:
                    '3  Right palm over left dorsum with interlaced fingers and vise-versa. ',
              ),
              SizedBox(
                height: 20.0,
              ),
              instructionRow(
                ImageShown: 'assets/images/step4.png',
                instruction: '4  palm to palm with fingers interlaced.',
              ),
              SizedBox(
                height: 20.0,
              ),
              instructionRow(
                ImageShown: 'assets/images/step5.png',
                instruction:
                    '5  Backs of fingers to opposing palms with fingers interlocked.',
              ),
              SizedBox(
                height: 20.0,
              ),
              instructionRow(
                ImageShown: 'assets/images/step6.png',
                instruction:
                    '6  Rotational rolling of left thumb clasped in right palm and vice-versa. ',
              ),
              SizedBox(
                height: 20.0,
              ),
              instructionRow(
                ImageShown: 'assets/images/step7.png',
                instruction:
                    '7  Rotatioinal rubbing ,backwards and forwards with clasped fingers of right hand in left palm and vice versa',
              ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class instructionRow extends StatelessWidget {
  final ImageShown;
  final instruction;

  instructionRow({this.ImageShown, this.instruction});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12),
      height: 150.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset(0, 8), blurRadius: 24, color: kActiveShadowColor)
      ], borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Row(
        children: <Widget>[
          Image.asset(
            ImageShown,
            alignment: Alignment.topLeft,
          ),
          SizedBox(
            width: 14,
          ),
          Expanded(
            child: Text(
              instruction,
              style: kSubTextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
