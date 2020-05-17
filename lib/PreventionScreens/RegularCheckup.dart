import 'package:flutter/material.dart';
import 'package:covid19app/constants.dart';

class RegularCheckupPage extends StatefulWidget {
  @override
  _RegularCheckupPageState createState() => _RegularCheckupPageState();
}

class _RegularCheckupPageState extends State<RegularCheckupPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              height: 280.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 24,
                        color: kActiveShadowColor)
                  ],
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0)),
                  image: DecorationImage(
                      image: AssetImage('assets/images/checkuppage.png')),
                  gradient: LinearGradient(colors: [
                    Color(0xFF3383CD).withOpacity(0.7),
                    Color(0xFF11249F).withOpacity(0.30),
                  ])),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Text(
                'You must have a regular checkup if you find any of symptoms of covid -19. As some covid 19 patients may experience mild symptoms.',
                style: kSubTextStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
              child: Text(
                '      Thus having a regular checkup may save many lives around you as the virus is very contagious.',
                style: kSubTextStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
