import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'MoreCovidDataScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingpageVirus extends StatefulWidget {
  @override
  _LoadingpageVirusState createState() => _LoadingpageVirusState();
}

class _LoadingpageVirusState extends State<LoadingpageVirus> {
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

  void GertAllData() async {
    await getMoreData();
    await getRegionalData();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MoreInfoOnCovidPage()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GertAllData();
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
            image: DecorationImage(
                image: AssetImage('assets/images/loadingimage.png'))),
        child: Center(
          child: SpinKitFadingCircle(
            color: Colors.black,
            size: 120.0,
          ),
        ),
      ),
    );
  }
}
