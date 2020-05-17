import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'MoreInfoScreens/Helpline.dart';

class helplineLoadingPage extends StatefulWidget {
  @override
  _helplineLoadingPageState createState() => _helplineLoadingPageState();
}

class _helplineLoadingPageState extends State<helplineLoadingPage> {
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
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HelplinePage()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHelplineNumber();
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
                image: AssetImage('assets/images/helplineloading.png'))),
        child: Align(
          alignment: Alignment.topCenter,
          child: SpinKitFadingCircle(
            color: Colors.white,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
