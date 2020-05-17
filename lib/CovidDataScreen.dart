import 'package:covid19app/MoreCovidDataScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'LoadingScreen.dart';

String SelectedCity = 'Nagpur';

final String CovidUrl =
    'https://corona-virus-world-and-india-data.p.rapidapi.com/api_india';
final ApiKey = 'bb802745e5msh06f6819e534b575p185891jsnfa8d79b89d3f';

var ConfirmedData = Confirmed;
var DeathData = death;
var RecoveredData = cured;
var InitialInfectedData = 146;
var InitialDeath = 5;
var InitialRecovered = 45;

class CovidDataPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CovidDataPage> {
  void GetCovidData() async {
    http.Response response =
        await http.get(CovidUrl, headers: {"x-rapidapi-key": ApiKey});
    setState(() {
      if (response.statusCode == 200) {
        var data = response.body;
        ConfirmedData = jsonDecode(data)['state_wise']['Maharashtra']
            ['district'][SelectedCity]['confirmed'];
        DeathData = jsonDecode(data)['state_wise']['Maharashtra']['district']
            [SelectedCity]['deceased'];
        RecoveredData = jsonDecode(data)['state_wise']['Maharashtra']
            ['district'][SelectedCity]['recovered'];
        print(ConfirmedData);
        print(DeathData);
        print(RecoveredData);
      } else {
        print(response.statusCode);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetCovidData();
  }

  var count = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.popUntil(context, (route) {
          return count++ == 2;
        });
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: EdgeInsets.only(right: 30.0, left: 30.0),
                height: 320.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    gradient: LinearGradient(
                        colors: [Color(0xFF3383CD), Color(0xFF11249F)],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft),
                    image: DecorationImage(
                        image: AssetImage('assets/images/virus.png'))),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(
                          'assets/icons/menu.svg',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(
                      child: Stack(children: <Widget>[
                        Align(
                          child: SvgPicture.asset(
                            'assets/icons/Drcorona.svg',
                            width: 240,
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter,
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Positioned(
                          top: 20.0,
                          right: 10.0,
                          child: Text(
                            'All You Need To \n Do Is Stay At Home',
                            style:
                                kHeadingTextStyle.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 50.0,
              width: double.infinity,
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Color(0xFFE5E5E5))),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset('assets/icons/maps-and-flags.svg'),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                      child: DropdownButton<String>(
                    value: SelectedCity,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'Mumbai',
                          style: kDropDownListStyle,
                        ),
                        value: 'Mumbai',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'Pune',
                          style: kDropDownListStyle,
                        ),
                        value: 'Pune',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'Nagpur',
                          style: kDropDownListStyle,
                        ),
                        value: 'Nagpur',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'Nanded',
                          style: kDropDownListStyle,
                        ),
                        value: 'Nanded',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'Nashik',
                          style: kDropDownListStyle,
                        ),
                        value: 'Nashik',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'Aurangabad',
                          style: kDropDownListStyle,
                        ),
                        value: 'Aurangabad',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'Akola',
                          style: kDropDownListStyle,
                        ),
                        value: 'Akola',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'Beed',
                          style: kDropDownListStyle,
                        ),
                        value: 'Beed',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'Washim',
                          style: kDropDownListStyle,
                        ),
                        value: 'Washim',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'Osmanabad',
                          style: kDropDownListStyle,
                        ),
                        value: 'Osmanabad',
                      ),
                      DropdownMenuItem(
                        child: Text(
                          'Sindhudurg',
                          style: kDropDownListStyle,
                        ),
                        value: 'Sindhudurg',
                      ),
                    ],
                    isExpanded: true,
                    underline: SizedBox(),
                    onChanged: (value) {
                      setState(() {
                        SelectedCity = value;
                        GetCovidData();
                      });
                    },
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: <Widget>[
                  ConfirmedData > 15
                      ? RedZoneIndicator()
                      : ConfirmedData == 0
                          ? GreenZoneIndicator()
                          : OrangeZoneIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 30.0,
                              color: KshadowColor)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CovidDat(
                          IntData: ConfirmedData,
                          color: kInfectedColor,
                          title: 'Infected',
                        ),
                        CovidDat(
                          IntData: DeathData,
                          color: kDeathColor,
                          title: 'Deaths',
                        ),
                        CovidDat(
                          IntData: RecoveredData,
                          color: kRecoverColor,
                          title: 'Recovered',
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GreenZoneIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(10, 30)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 24,
              color: kActiveShadowColor,
            )
          ],
          gradient: LinearGradient(
            colors: [
              Color(0xFF00C301),
              Color(0xFF4DED30).withOpacity(0.7),
            ],
          )),
      child: Row(
        children: <Widget>[
          Image.asset('assets/images/safe.png'),
          SizedBox(
            width: 10.0,
          ),
          Text(
            'Your City Lies In GREEN Zone',
            style: kHeadingTextStyle.copyWith(
                fontSize: 20.0, letterSpacing: 1, color: Colors.black),
          )
        ],
      ),
    );
  }
}

class OrangeZoneIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(10, 30)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 24,
              color: kActiveShadowColor,
            )
          ],
          gradient: LinearGradient(
            colors: [
              Color(0xFFFF6200),
              Color(0xFFFD9346).withOpacity(0.7),
            ],
          )),
      child: Row(
        children: <Widget>[
          Image.asset('assets/images/orange.png'),
          SizedBox(
            width: 10.0,
          ),
          Text(
            'Your City Lies In ORANGE Zone',
            style: kHeadingTextStyle.copyWith(
                fontSize: 18.0, letterSpacing: 1, color: Colors.black),
          )
        ],
      ),
    );
  }
}

class RedZoneIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(10, 30)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 24,
              color: kActiveShadowColor,
            )
          ],
          gradient: LinearGradient(
            colors: [
              Color(0xFFDC0004).withOpacity(0.8),
              Color(0xFFEC5441).withOpacity(0.7),
            ],
          )),
      child: Row(
        children: <Widget>[
          Image.asset('assets/images/containment.png'),
          SizedBox(
            width: 10.0,
          ),
          Text(
            'Your City Lies In RED Zone',
            style: kHeadingTextStyle.copyWith(
                fontSize: 20.0, letterSpacing: 1, color: Colors.black),
          )
        ],
      ),
    );
  }
}

class CovidDat extends StatefulWidget {
  final color;
  final IntData;
  final String title;
  CovidDat({this.color, this.title, this.IntData});
  @override
  _CovidDatState createState() => _CovidDatState();
}

class _CovidDatState extends State<CovidDat> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6.0),
          height: 25.0,
          width: 25.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: widget.color.withOpacity(0.26)),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(width: 2.0, color: widget.color)),
          ),
        ),
        Text(
          widget.IntData.toString(),
          style: TextStyle(fontSize: 42, color: widget.color),
        ),
        Text(
          widget.title,
          style: kSubTextStyle,
        )
      ],
    );
    ;
  }
}

class DropDownList extends StatefulWidget {
  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
