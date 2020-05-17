import 'dart:io';
import 'package:covid19app/CovidDataScreen.dart';
import 'package:covid19app/LoadingScreen.dart';
import 'package:covid19app/MainScreen.dart';
import 'package:covid19app/MoreCovidDataScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
import 'Starting_Screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID 19 APP',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: 'Poppins',
          textTheme: TextTheme(body1: TextStyle(color: kBodyTextColor))),
      routes: {
        '/': (BuildContext context) => StartingScreen(),
        '/Morecovidpage': (BuildContext context) => MoreInfoOnCovidPage(),
        '/loadingdscreen': (BuildContext context) => LoadingSceenPage(),
        '/covidpage': (BuildContext context) => CovidDataPage()
      },
      initialRoute: '/',
    );
  }
}
