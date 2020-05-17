import 'dart:ffi';
import 'package:covid19app/CovidDataScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:covid19app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';

var Helplineumber;
int SerialNumber = 13;

class HelplinePage extends StatefulWidget {
  @override
  _HelplinePageState createState() => _HelplinePageState();
}

class _HelplinePageState extends State<HelplinePage> {
  void getHelplineNumber() async {
    http.Response response =
        await http.get('https://api.rootnet.in/covid19-in/contacts');
    setState(() {
      if (response.statusCode == 200) {
        var data = response.body;
        Helplineumber = jsonDecode(data)['data']['contacts']['regional']
            [SerialNumber]['number'];
        print(Helplineumber);
      } else {
        print('f');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHelplineNumber();
  }

  var count = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.popUntil(context, (routes) {
          return count++ == 2;
        });
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    height: 280.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 8),
                          blurRadius: 24,
                          color: kActiveShadowColor,
                        )
                      ],
                      gradient: LinearGradient(
                          colors: [
                            Color(0xFF3383CD).withOpacity(0.5),
                            Color(0xFF11249F).withOpacity(0.8),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Image.asset(
                                  'assets/images/call.png',
                                  width: 130.0,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            Positioned(
                                left: 170.0,
                                top: 40.0,
                                child: Text(
                                  'DIAL 1075\n FOR MEDICAL\n HELP!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 26.0,
                                      letterSpacing: 2),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    'STATE-WISE HELPINE NUMBER',
                    style: KTitleTextStyle.copyWith(fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      border: Border.all(color: Color(0xFFE5E5E5))),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: DropdownButton(
                          value: SerialNumber,
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                'Andhra Pradesh',
                                style: kDropDownListStyle,
                              ),
                              value: 0,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Arunachal Pradesh',
                                style: kDropDownListStyle,
                              ),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Assam',
                                style: kDropDownListStyle,
                              ),
                              value: 2,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Bihar',
                                style: kDropDownListStyle,
                              ),
                              value: 3,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Chhattisgarh',
                                style: kDropDownListStyle,
                              ),
                              value: 4,
                            ),
                            DropdownMenuItem(
                                child: Text(
                                  'Goa',
                                  style: kDropDownListStyle,
                                ),
                                value: 5),
                            DropdownMenuItem(
                              child: Text(
                                'Gujarat',
                                style: kDropDownListStyle,
                              ),
                              value: 6,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Haryana',
                                style: kDropDownListStyle,
                              ),
                              value: 7,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Himachal Pradesh',
                                style: kDropDownListStyle,
                              ),
                              value: 8,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Jharkhand',
                                style: kDropDownListStyle,
                              ),
                              value: 9,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Karnataka',
                                style: kDropDownListStyle,
                              ),
                              value: 10,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Kerala',
                                style: kDropDownListStyle,
                              ),
                              value: 11,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Madhya Pradesh',
                                style: kDropDownListStyle,
                              ),
                              value: 12,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Maharashtra',
                                style: kDropDownListStyle,
                              ),
                              value: 13,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Manipur',
                                style: kDropDownListStyle,
                              ),
                              value: 14,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Meghalaya',
                                style: kDropDownListStyle,
                              ),
                              value: 15,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Mizoram',
                                style: kDropDownListStyle,
                              ),
                              value: 16,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Nagaland',
                                style: kDropDownListStyle,
                              ),
                              value: 17,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Odisha',
                                style: kDropDownListStyle,
                              ),
                              value: 18,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Punjab',
                                style: kDropDownListStyle,
                              ),
                              value: 19,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Rajasthan',
                                style: kDropDownListStyle,
                              ),
                              value: 20,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Sikkim',
                                style: kDropDownListStyle,
                              ),
                              value: 21,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Tamil Nadu',
                                style: kDropDownListStyle,
                              ),
                              value: 22,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Telengana',
                                style: kDropDownListStyle,
                              ),
                              value: 23,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Tripura',
                                style: kDropDownListStyle,
                              ),
                              value: 24,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Uttarakhand',
                                style: kDropDownListStyle,
                              ),
                              value: 25,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Uttar Pradesh',
                                style: kDropDownListStyle,
                              ),
                              value: 26,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'West Bengal',
                                style: kDropDownListStyle,
                              ),
                              value: 27,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Andaman and Nicobar Islands',
                                style: kDropDownListStyle,
                              ),
                              value: 28,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Chandigarh',
                                style: kDropDownListStyle,
                              ),
                              value: 29,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Dadra and Nagar Haveli',
                                style: kDropDownListStyle,
                              ),
                              value: 30,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Daman & Diu',
                                style: kDropDownListStyle,
                              ),
                              value: 31,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Delhi',
                                style: kDropDownListStyle,
                              ),
                              value: 32,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Jammu and Kashmir',
                                style: kDropDownListStyle,
                              ),
                              value: 33,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Jammu and Kashmir',
                                style: kDropDownListStyle,
                              ),
                              value: 34,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Ladakh',
                                style: kDropDownListStyle,
                              ),
                              value: 35,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Lakshadweep',
                                style: kDropDownListStyle,
                              ),
                              value: 36,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Puducherry',
                                style: kDropDownListStyle,
                              ),
                              value: 37,
                            ),
                          ],
                          isExpanded: true,
                          underline: SizedBox(),
                          onChanged: (value) {
                            setState(() {
                              SerialNumber = value;
                              getHelplineNumber();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  margin: EdgeInsets.only(left: 25.0, right: 25.0),
                  height: 130.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 8),
                            blurRadius: 24.0,
                            color: kActiveShadowColor),
                      ],
                      gradient: LinearGradient(
                          colors: [
                            Color(0xFF11249F).withOpacity(0.7),
                            Color(0xFF3383CD).withOpacity(0.5),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Image.asset(
                          'assets/images/call.png',
                          width: 60.0,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Text(
                        '$Helplineumber',
                        style: kHeadingTextStyle.copyWith(
                            color: Color(0xFF741F53), fontSize: 30.0),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width * 0.60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 8),
                            blurRadius: 24,
                            color: kActiveShadowColor),
                      ],
                      gradient: LinearGradient(colors: [
                        Color(0xFF584284).withOpacity(0.9),
                        Color(0xFFBE92F6).withOpacity(0.9),
                      ])),
                  child: GradientText(
                    'Websites',
                    style: kHeadingTextStyle.copyWith(
                        fontSize: 25, letterSpacing: 2),
                    gradient: Gradients.deepSpace,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Ministry Of Home Affairs India',
                              style: kHeadingTextStyle.copyWith(
                                  color: Colors.blue[900]),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  await launch('https://www.mha.gov.in/');
                                })
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 5),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text:
                                  'Ministry Of Health And Family Welfare India',
                              style: kHeadingTextStyle.copyWith(
                                  color: Colors.blue[900]),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  await launch('https://www.mohfw.gov.in/');
                                })
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'World Health Organization',
                              style: kHeadingTextStyle.copyWith(
                                  color: Colors.blue[900]),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  await launch('https://www.who.int/');
                                })
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
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
