import 'package:covid19app/MoreCovidDataScreen.dart';

import 'CovidDataScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final String CovidUrl =
    'https://corona-virus-world-and-india-data.p.rapidapi.com/api_india';
final ApiKey = 'bb802745e5msh06f6819e534b575p185891jsnfa8d79b89d3f';
var Confirmed;
var death;
var cured;

class LoadingSceenPage extends StatefulWidget {
  @override
  _LoadingSceenPageState createState() => _LoadingSceenPageState();
}

class _LoadingSceenPageState extends State<LoadingSceenPage> {
  void GetCovidData() async {
    http.Response response =
        await http.get(CovidUrl, headers: {"x-rapidapi-key": ApiKey});
    Confirmed = json.decode(response.body)['state_wise']['Maharashtra']
        ['district']['Nagpur']['confirmed'];
    death = json.decode(response.body)['state_wise']['Maharashtra']['district']
        ['Nagpur']['deceased'];
    cured = json.decode(response.body)['state_wise']['Maharashtra']['district']
        ['Nagpur']['recovered'];
    Navigator.of(context).push(MaterialPageRoute(
        settings: RouteSettings(name: '/covidpage'),
        builder: (context) => CovidDataPage()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetCovidData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFF3383CD).withOpacity(0.8),
            Color(0xFF11249F).withOpacity(0.25),
          ]),
          image: DecorationImage(image: AssetImage('assets/images/fight1.png')),
        ),
        child: Center(
            child: SpinKitCircle(
          color: Colors.black,
          size: 100.0,
        )),
      ),
    );
  }
}
