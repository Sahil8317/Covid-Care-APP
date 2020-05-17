import 'package:flutter/material.dart';
import 'package:covid19app/constants.dart';

class SocialDistancingPage extends StatefulWidget {
  @override
  _VaccinePageState createState() => _VaccinePageState();
}

class _VaccinePageState extends State<SocialDistancingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 400.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 24,
                        color: kActiveShadowColor),
                  ],
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF3383CD).withOpacity(0.5),
                      Color(0xFF11249F).withOpacity(0.8),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image:
                          AssetImage('assets/images/socialdistancing2.png'))),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 19.0, top: 19.0),
                child: Text(
                  'Social Distancing',
                  style: KTitleTextStyle.copyWith(fontSize: 28.0),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 10.0),
              child: Text(
                'Social distancing, also called “physical distancing,” means keeping space between yourself and other people outside of your home.'
                ' To practice social or physical distancing:',
                style: kSubTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 10.0),
              child: Text(
                'Stay at least 6 feet (about 2 arms’ length) from other people\n'
                'Do not gather in groups.\n'
                'Stay out of crowded places and avoid mass gatherings',
                style: kSubTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
