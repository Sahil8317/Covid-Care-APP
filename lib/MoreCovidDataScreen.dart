import 'dart:convert';

import 'package:covid19app/CovidDataScreen.dart';
import 'package:covid19app/LoadingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constants.dart';
import 'package:http/http.dart' as http;
import 'MainScreen.dart';

var TotalCases;
var ConfirmedCases;
var Dischrged;
var DeathsCases;
var Rtotalcases;
var RConfirmedCases;
var RDischarged;
var RDeathCases;
int selectedState = 19;

class MoreInfoOnCovidPage extends StatefulWidget {
  @override
  _MoreInfoOnCovidPageState createState() => _MoreInfoOnCovidPageState();
}

class _MoreInfoOnCovidPageState extends State<MoreInfoOnCovidPage> {
  void getMoreData() async {
    http.Response response =
        await http.get('https://api.rootnet.in/covid19-in/stats/latest');
    setState(() {
      if (response.statusCode == 200) {
        var Data = response.body;
        TotalCases = jsonDecode(Data)['data']['summary']['total'];
        ConfirmedCases =
            jsonDecode(Data)['data']['summary']['confirmedCasesIndian'];
        Dischrged = jsonDecode(Data)['data']['summary']['discharged'];
        DeathsCases = jsonDecode(Data)['data']['summary']['deaths'];
        print(ConfirmedCases);
      } else {
        print('f');
      }
    });
  }

  void getRegionalData() async {
    http.Response response =
        await http.get('https://api.rootnet.in/covid19-in/stats/latest');
    setState(() {
      if (response.statusCode == 200) {
        var Data = response.body;
        var MainData = json.decode(Data)['data']['regional'];
        Rtotalcases = MainData[selectedState]['totalConfirmed'];
        RConfirmedCases = MainData[selectedState]['confirmedCasesIndian'];
        RDeathCases = MainData[selectedState]['deaths'];
        RDischarged = MainData[selectedState]['discharged'];
      } else {
        print('f');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMoreData();
    getRegionalData();
  }

  var count = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.popUntil(context, (route) {
          return count++ == 2;
        });
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF3383CD).withOpacity(0.8),
                      Color(0xFF11249F).withOpacity(0.25),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, top: 25.0, right: 25.0),
                        child: Text(
                          'COVID-19 INDIA',
                          style: kHeadingTextStyle.copyWith(fontSize: 36.0),
                        ),
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ReusableContainer2(
                            color: Color(0xFFADD2FE),
                            Cases: TotalCases,
                            text: 'Total Cases',
                          ),
                          ReusableContainer2(
                            color: Color(0xFFF8C76B),
                            Cases: ConfirmedCases,
                            text: 'Confirmed Cases',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ReusableContainer2(
                            color: Color(0xFFB6F18C),
                            Cases: Dischrged,
                            text: 'Cured Cases',
                          ),
                          ReusableContainer2(
                            color: Color(0xFFFF8B8A),
                            Cases: DeathsCases,
                            text: 'Death Cases',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        'Regional Cases',
                        style: kHeadingTextStyle.copyWith(fontSize: 25.0),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        margin: EdgeInsets.only(left: 25.0, right: 25.0),
                        height: 50.0,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        width: double.infinity,
                        child: DropdownButton(
                          onChanged: (value) {
                            setState(() {
                              selectedState = value;
                              getRegionalData();
                            });
                          },
                          value: selectedState,
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                'Andaman and Nicobar Islands',
                                style: kDropDownListStyle,
                              ),
                              value: 0,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Andhra Pradesh',
                                style: kDropDownListStyle,
                              ),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Arunachal Pradesh',
                                style: kDropDownListStyle,
                              ),
                              value: 2,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Assam',
                                style: kDropDownListStyle,
                              ),
                              value: 3,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Bihar',
                                style: kDropDownListStyle,
                              ),
                              value: 4,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Chandigarh',
                                style: kDropDownListStyle,
                              ),
                              value: 5,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Chhattisgarh',
                                style: kDropDownListStyle,
                              ),
                              value: 6,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Dadar Nagar Haveli',
                                style: kDropDownListStyle,
                              ),
                              value: 7,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Delhi',
                                style: kDropDownListStyle,
                              ),
                              value: 8,
                            ),
                            DropdownMenuItem(
                                child: Text(
                                  'Goa',
                                  style: kDropDownListStyle,
                                ),
                                value: 9),
                            DropdownMenuItem(
                              child: Text(
                                'Gujarat',
                                style: kDropDownListStyle,
                              ),
                              value: 10,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Haryana',
                                style: kDropDownListStyle,
                              ),
                              value: 11,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Himachal Pradesh',
                                style: kDropDownListStyle,
                              ),
                              value: 12,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Jammu and Kashmir',
                                style: kDropDownListStyle,
                              ),
                              value: 13,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Jharkhand',
                                style: kDropDownListStyle,
                              ),
                              value: 14,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Karnataka',
                                style: kDropDownListStyle,
                              ),
                              value: 15,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Kerala',
                                style: kDropDownListStyle,
                              ),
                              value: 16,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Ladakh',
                                style: kDropDownListStyle,
                              ),
                              value: 17,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Madhya Pradesh',
                                style: kDropDownListStyle,
                              ),
                              value: 18,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Maharashtra',
                                style: kDropDownListStyle,
                              ),
                              value: 19,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Manipur',
                                style: kDropDownListStyle,
                              ),
                              value: 20,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Meghalaya',
                                style: kDropDownListStyle,
                              ),
                              value: 21,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Mizoram',
                                style: kDropDownListStyle,
                              ),
                              value: 22,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Odisha',
                                style: kDropDownListStyle,
                              ),
                              value: 23,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Puducherry',
                                style: kDropDownListStyle,
                              ),
                              value: 24,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Punjab',
                                style: kDropDownListStyle,
                              ),
                              value: 25,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Rajasthan',
                                style: kDropDownListStyle,
                              ),
                              value: 26,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Tamil Nadu',
                                style: kDropDownListStyle,
                              ),
                              value: 27,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Telengana',
                                style: kDropDownListStyle,
                              ),
                              value: 28,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Tripura',
                                style: kDropDownListStyle,
                              ),
                              value: 29,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Uttarakhand',
                                style: kDropDownListStyle,
                              ),
                              value: 30,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'Uttar Pradesh',
                                style: kDropDownListStyle,
                              ),
                              value: 31,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                'West Bengal',
                                style: kDropDownListStyle,
                              ),
                              value: 32,
                            ),
                          ],
                          isExpanded: true,
                          underline: SizedBox(),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ReusableContainer2(
                            color: Color(0xFFADD2FE),
                            Cases: Rtotalcases,
                            text: 'Total Cases',
                          ),
                          ReusableContainer2(
                            color: Color(0xFFF8C76B),
                            Cases: RConfirmedCases,
                            text: 'Confirmed Cases',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ReusableContainer2(
                            color: Color(0xFFB6F18C),
                            Cases: RDischarged,
                            text: 'Cured Cases',
                          ),
                          ReusableContainer2(
                            color: Color(0xFFFF8B8A),
                            Cases: RDeathCases,
                            text: 'Death Cases',
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              settings: RouteSettings(name: '/loadingscreen'),
                              builder: (context) => LoadingSceenPage()));
                        },
                        child: Container(
                          padding: EdgeInsets.only(right: 20.0),
                          height: 50.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 8),
                                  blurRadius: 24,
                                  color: kActiveShadowColor,
                                )
                              ],
                              gradient: LinearGradient(colors: [
                                Color(0xFF584284).withOpacity(0.9),
                                Color(0xFFBE92F6).withOpacity(0.7)
                              ])),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                'CLICK HERE FOR MORE!',
                                style: kHeadingTextStyle.copyWith(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 4),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              SvgPicture.asset(
                                'assets/icons/forward.svg',
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableContainer2 extends StatelessWidget {
  final Color color;
  final Cases;
  final text;
  ReusableContainer2({this.color, this.Cases, this.text});
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      child: Container(
        height: 150.0,
        width: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
          color: color,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 24,
              color: kActiveShadowColor,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            children: <Widget>[
              Text(
                '$Cases',
                style: kHeadingTextStyle.copyWith(
                    fontSize: 32.0, color: Color(0xFF002C56)),
              ),
              Text(
                text,
                style: kHeadingTextStyle.copyWith(fontSize: 15.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
