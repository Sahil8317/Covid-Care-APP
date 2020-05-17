import 'package:flutter/material.dart';
import 'package:covid19app/constants.dart';

class CoverYourCoughPage extends StatefulWidget {
  @override
  _CoverYourCoughPageState createState() => _CoverYourCoughPageState();
}

class _CoverYourCoughPageState extends State<CoverYourCoughPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 280.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 9),
                          blurRadius: 24,
                          color: kActiveShadowColor)
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                    gradient: LinearGradient(colors: [
                      Color(0xFF3383CD).withOpacity(0.7),
                      Color(0xFF11249F).withOpacity(0.30),
                    ]),
                    image: DecorationImage(
                        alignment: Alignment.bottomLeft,
                        image: AssetImage('assets/images/covercough.png'))),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      'COVER YOUR\n COUGH!',
                      style: kHeadingTextStyle.copyWith(fontSize: 22),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
                child: Text(
                  '1  Cough and sneeze into tissues, throw the tissues away, and wash your hands.',
                  style: kSubTextStyle.copyWith(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 10),
                child: Text(
                  '2  If you don\'t have a tissue, turn away from people and cough into your shoulder or your sleeve.',
                  style: kSubTextStyle.copyWith(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 10),
                child: Text(
                  '3  Do not cover your coughs and sneezes with your hands.',
                  style: kSubTextStyle.copyWith(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 10),
                child: Text(
                  '4  Don\'t touch your eyes, nose or mouth.',
                  style: kSubTextStyle.copyWith(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
