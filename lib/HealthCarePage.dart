import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

var ruralHsopitals;
var ruralBeds;
var urbanHospitals;
var urbanBeds;
var totalHospitals;
var totalBeds;
final String api = 'https://api.rootnet.in/covid19-in/hospitals/beds';
var selectrdcity = 13;
var Rruralhospitals,
    Rruralbeds,
    RurbanHospitals,
    RUrbanbeds,
    Rtotalhospitals,
    Rtotalbeds;
var date, totalsampletested;
var sourcelink;
var testingApi = 'https://api.rootnet.in/covid19-in/stats/testing/latest';

class HealthCare extends StatefulWidget {
  @override
  _HealthCareState createState() => _HealthCareState();
}

class _HealthCareState extends State<HealthCare> {
  void getHospitalsData() async {
    http.Response response = await http.get(api);
    setState(() {
      if (response.statusCode == 200) {
        ruralHsopitals =
            jsonDecode(response.body)['data']['summary']['ruralHospitals'];
        ruralBeds = jsonDecode(response.body)['data']['summary']['ruralBeds'];
        urbanHospitals =
            jsonDecode(response.body)['data']['summary']['urbanHospitals'];
        urbanBeds = jsonDecode(response.body)['data']['summary']['urbanBeds'];
        totalHospitals =
            jsonDecode(response.body)['data']['summary']['totalHospitals'];
        totalBeds = jsonDecode(response.body)['data']['summary']['totalBeds'];
      } else {
        print('f');
      }
    });
  }

  void GetRegionalFacilities() async {
    http.Response response = await http.get(api);
    setState(() {
      if (response.statusCode == 200) {
        Rruralhospitals = jsonDecode(response.body)['data']['regional']
            [selectrdcity]['ruralHospitals'];
        Rruralbeds = jsonDecode(response.body)['data']['regional'][selectrdcity]
            ['ruralBeds'];
        RurbanHospitals = jsonDecode(response.body)['data']['regional']
            [selectrdcity]['urbanHospitals'];
        RUrbanbeds = jsonDecode(response.body)['data']['regional'][selectrdcity]
            ['urbanBeds'];
        Rtotalhospitals = jsonDecode(response.body)['data']['regional']
            [selectrdcity]['totalHospitals'];
        Rtotalbeds = jsonDecode(response.body)['data']['regional'][selectrdcity]
            ['totalBeds'];
      } else {
        print('f');
      }
    });
  }

  void gettestingData() async {
    http.Response response = await http.get(testingApi);
    setState(() {
      date = jsonDecode(response.body)['data']['day'];
      totalsampletested =
          jsonDecode(response.body)['data']['totalSamplesTested'];
      sourcelink = jsonDecode(response.body)['data']['source'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHospitalsData();
    GetRegionalFacilities();
    gettestingData();
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
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xFF3383CD).withOpacity(0.8),
                Color(0xFF11249F).withOpacity(0.25),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Material(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10, 20)),
                        elevation: 8,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          width: double.infinity,
                          height: 65.0,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 8),
                                    blurRadius: 25,
                                    color: kActiveShadowColor)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(10, 20)),
                              gradient: LinearGradient(colors: [
                                Color(0xFF3383CD),
                                Color(0xFF11249F).withOpacity(0.6),
                              ])),
                          child: GradientText('Health InfraStructure',
                              textAlign: TextAlign.center,
                              style: kHeadingTextStyle.copyWith(
                                fontSize: 28,
                              ),
                              gradient: Gradients.deepSpace),
                        ),
                      )),
                  SizedBox(
                    height: 15.0,
                  ),
                  Material(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 50.0,
                      width: MediaQuery.of(context).size.width * 0.70,
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
                        'Medical Facilities',
                        textAlign: TextAlign.center,
                        style: kHeadingTextStyle.copyWith(
                          letterSpacing: 2,
                        ),
                        gradient: Gradients.deepSpace,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15.0),
                    height: 240.0,
                    width: MediaQuery.of(context).size.width * 0.65,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 6),
                            blurRadius: 24,
                            color: kActiveShadowColor),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GradientText(
                          'Rural Hospitals : $ruralHsopitals',
                          style: kHeadingTextStyle.copyWith(
                              fontWeight: FontWeight.w400),
                          gradient: Gradients.deepSpace,
                        ),
                        GradientText(
                          'Rural Beds : $ruralBeds',
                          style: kHeadingTextStyle.copyWith(
                              fontWeight: FontWeight.w400),
                          gradient: Gradients.deepSpace,
                        ),
                        GradientText(
                          'Urban Hospitals : $urbanHospitals',
                          style: kHeadingTextStyle.copyWith(
                              fontWeight: FontWeight.w400),
                          gradient: Gradients.deepSpace,
                        ),
                        GradientText(
                          'Urban Beds : $urbanBeds',
                          style: kHeadingTextStyle.copyWith(
                              fontWeight: FontWeight.w400),
                          gradient: Gradients.deepSpace,
                        ),
                        GradientText(
                          'Total Hospitals : $totalHospitals',
                          style: kHeadingTextStyle.copyWith(
                              fontWeight: FontWeight.w400),
                          gradient: Gradients.deepSpace,
                        ),
                        GradientText(
                          'Total Beds : $totalBeds',
                          style: kHeadingTextStyle.copyWith(
                              fontWeight: FontWeight.w400),
                          gradient: Gradients.deepSpace,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage('assets/images/fight2.png'))),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      height: 50.0,
                      width: MediaQuery.of(context).size.width * 0.70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0)),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 8),
                                blurRadius: 24,
                                color: kActiveShadowColor)
                          ],
                          gradient: LinearGradient(colors: [
                            Color(0xFFBE92F6),
                            Color(0xFF584284).withOpacity(0.85)
                          ])),
                      child: GradientText(
                        'Regional Facilities',
                        textAlign: TextAlign.center,
                        style: kHeadingTextStyle.copyWith(letterSpacing: 2),
                        gradient: Gradients.deepSpace,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 280.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 8),
                            blurRadius: 24,
                            color: kActiveShadowColor)
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20.0, right: 20.0),
                          height: 40.0,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          child: DropdownButton(
                            value: selectrdcity,
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
                                  'Jammu and Kashmir',
                                  style: kDropDownListStyle,
                                ),
                                value: 9,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Jharkhand',
                                  style: kDropDownListStyle,
                                ),
                                value: 10,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Karnataka',
                                  style: kDropDownListStyle,
                                ),
                                value: 11,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Kerala',
                                  style: kDropDownListStyle,
                                ),
                                value: 12,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Madhya Pradesh',
                                  style: kDropDownListStyle,
                                ),
                                value: 13,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Maharashtra',
                                  style: kDropDownListStyle,
                                ),
                                value: 14,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Manipur',
                                  style: kDropDownListStyle,
                                ),
                                value: 15,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Meghalaya',
                                  style: kDropDownListStyle,
                                ),
                                value: 16,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Mizoram',
                                  style: kDropDownListStyle,
                                ),
                                value: 17,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Nagaland',
                                  style: kDropDownListStyle,
                                ),
                                value: 18,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Odisha',
                                  style: kDropDownListStyle,
                                ),
                                value: 19,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Punjab',
                                  style: kDropDownListStyle,
                                ),
                                value: 20,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Rajasthan',
                                  style: kDropDownListStyle,
                                ),
                                value: 21,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Sikkim',
                                  style: kDropDownListStyle,
                                ),
                                value: 22,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Tamil Nadu',
                                  style: kDropDownListStyle,
                                ),
                                value: 23,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Telengana',
                                  style: kDropDownListStyle,
                                ),
                                value: 24,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Tripura',
                                  style: kDropDownListStyle,
                                ),
                                value: 25,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Uttarakhand',
                                  style: kDropDownListStyle,
                                ),
                                value: 26,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Uttar Pradesh',
                                  style: kDropDownListStyle,
                                ),
                                value: 27,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'West Bengal',
                                  style: kDropDownListStyle,
                                ),
                                value: 28,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Andaman and Nicobar Islands',
                                  style: kDropDownListStyle,
                                ),
                                value: 29,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Chandigarh',
                                  style: kDropDownListStyle,
                                ),
                                value: 30,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Dadra and Nagar Haveli',
                                  style: kDropDownListStyle,
                                ),
                                value: 31,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Daman & Diu',
                                  style: kDropDownListStyle,
                                ),
                                value: 32,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Delhi',
                                  style: kDropDownListStyle,
                                ),
                                value: 33,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Lakshadweep',
                                  style: kDropDownListStyle,
                                ),
                                value: 34,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Puducherry',
                                  style: kDropDownListStyle,
                                ),
                                value: 35,
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectrdcity = value;
                                GetRegionalFacilities();
                              });
                            },
                            isExpanded: true,
                            underline: SizedBox(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              GradientText(
                                'Rural Hosptals : $Rruralhospitals',
                                style: kHeadingTextStyle.copyWith(
                                    fontWeight: FontWeight.w400),
                                gradient: Gradients.deepSpace,
                              ),
                              GradientText(
                                'Rural Beds : $Rruralbeds',
                                style: kHeadingTextStyle.copyWith(
                                    fontWeight: FontWeight.w400),
                                gradient: Gradients.deepSpace,
                              ),
                              GradientText(
                                'Urban Hospitals : $RurbanHospitals',
                                style: kHeadingTextStyle.copyWith(
                                    fontWeight: FontWeight.w400),
                                gradient: Gradients.deepSpace,
                              ),
                              GradientText(
                                'Urban Beds : $RUrbanbeds',
                                style: kHeadingTextStyle.copyWith(
                                    fontWeight: FontWeight.w400),
                                gradient: Gradients.deepSpace,
                              ),
                              GradientText(
                                'Total Hospitals : $Rtotalhospitals',
                                style: kHeadingTextStyle.copyWith(
                                    fontWeight: FontWeight.w400),
                                gradient: Gradients.deepSpace,
                              ),
                              GradientText(
                                'Total Beds : $Rtotalbeds',
                                style: kHeadingTextStyle.copyWith(
                                    fontWeight: FontWeight.w400),
                                gradient: Gradients.deepSpace,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/finaltesting.png',
                        width: 250.0,
                        fit: BoxFit.fitWidth,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 50.0,
                    width: MediaQuery.of(context).size.width * 0.70,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 8),
                              blurRadius: 24,
                              color: kActiveShadowColor),
                        ],
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15.0),
                            topRight: Radius.circular(15.0)),
                        gradient: LinearGradient(colors: [
                          Color(0xFF584284).withOpacity(0.9),
                          Color(0xFFBE92F6).withOpacity(0.9),
                        ])),
                    child: GradientText(
                      'COVID-19 Testing',
                      textAlign: TextAlign.center,
                      style: kHeadingTextStyle.copyWith(letterSpacing: 2),
                      gradient: Gradients.deepSpace,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GradientText(
                          'DATE : $date',
                          style: kHeadingTextStyle.copyWith(
                              fontWeight: FontWeight.w400),
                          gradient: Gradients.deepSpace,
                        ),
                        GradientText(
                          'TotalSamplesTested : $totalsampletested',
                          style: kHeadingTextStyle.copyWith(
                              fontWeight: FontWeight.w400),
                          gradient: Gradients.deepSpace,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Source : $sourcelink',
                                style: kHeadingTextStyle.copyWith(
                                    color: Colors.black),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    final url = '$sourcelink';
                                    if (await canLaunch('$sourcelink')) {
                                      await launch(url);
                                    }
                                  })
                          ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
