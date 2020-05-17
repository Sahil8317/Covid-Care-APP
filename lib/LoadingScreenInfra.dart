import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'constants.dart';
import 'HealthCarePage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingPageInfra extends StatefulWidget {
  @override
  _LoadingPageInfraState createState() => _LoadingPageInfraState();
}

HealthCare healthCare = HealthCare();

class _LoadingPageInfraState extends State<LoadingPageInfra> {
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

  void getallData() async {
    await getHospitalsData();
    await GetRegionalFacilities();
    await gettestingData();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HealthCare()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getallData();
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
                image: AssetImage('assets/images/loading.png'))),
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
