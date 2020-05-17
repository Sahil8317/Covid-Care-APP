import 'package:covid19app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'MainScreen.dart';

class StartingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFF3383CD).withOpacity(0.8),
                      Color(0xFF11249F).withOpacity(0.1)
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    image: DecorationImage(
                        image: AssetImage('assets/images/fightstarting.png'))),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 70.0,
                      left: MediaQuery.of(context).size.width * 0.07,
                      child: Text(
                        'COVID CARE',
                        textAlign: TextAlign.center,
                        style: kHeadingTextStyle.copyWith(
                            fontSize: 58.0, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 160.0,
                      left: 22.0,
                      child: Text(
                        'An Covid-19 Information And Prevention App',
                        style: kSubTextStyle.copyWith(color: Colors.black),
                      ),
                    ),
                    Positioned(
                      left: 100.0,
                      bottom: 100.0,
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainScreenCovid()));
                          },
                          child: Container(
                            height: 45.0,
                            width: 200.0,
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                            child: Center(
                              child: Text(
                                'GET STARTED',
                                style: KTitleTextStyle.copyWith(
                                    color: kActiveShadowColor.withOpacity(1)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
