import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:covid19app/constants.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Lockdown.dart';

class StayHomePage extends StatefulWidget {
  @override
  _StayHomePageState createState() => _StayHomePageState();
}

class _StayHomePageState extends State<StayHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 250.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 8),
                          blurRadius: 24,
                          color: kActiveShadowColor),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/stayhomepage.png'),
                        fit: BoxFit.fitWidth),
                    gradient: LinearGradient(
                        colors: [
                          Color(0xFF584284).withOpacity(0.8),
                          Color(0xFFBE92F6).withOpacity(0.9),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, right: 12.0, top: 15.0),
                child: Text(
                  '      The STAY HOME STAY SAFE Message has been widely used by many Government agency to aware people about the spread of Covid-19 Virus.  By staying at home, you are doing your part to confront this pandemic and minimize community spread of COVID-19.',
                  style: kSubTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 5),
                child: Text(
                  'COVID-19 is spreading, and you may not know you’re infected until you’ve already infected others. Some individuals in our community are more vulnerable to COVID-19, and we need to do our part to keep them safe and stop the spread.'
                  'By staying at home, you’re doing your part to confront this pandemic and minimize community spread of COVID-19.'
                  'Stay home to protect yourself, your loved ones, your neighbors and our community.'
                  'Stay home to protect our frontline workers and give them a fighting chance to beat this disease.'
                  'Health professionals say staying at home means avoiding playdates, sleepovers, bars, restaurants, parties or houses of worship.'
                  'Stay home. Save lives. Maybe your own. Every one of us is safer at home.',
                  style: kSubTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              Container(
                padding: EdgeInsets.all(8),
                height: 50.0,
                width: MediaQuery.of(context).size.width * 0.70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)),
                    gradient: LinearGradient(colors: [
                      Color(0xFF584284).withOpacity(0.8),
                      Color(0xFFBE92F6).withOpacity(0.9),
                    ])),
                child: GradientText(
                  'Health Advisory',
                  style: kHeadingTextStyle.copyWith(letterSpacing: 2),
                  gradient: Gradients.deepSpace,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                                'Health Advisory for Elderly Population of India during COVID-19',
                            style: kHeadingTextStyle.copyWith(
                                color: Colors.blue[900]),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                await launch(
                                    'https://www.mohfw.gov.in/pdf/AdvisoryforElderlyPopulation.pdf');
                              }),
                      ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                                'Advisory on use of Homemade Protective Cover for Face & Mouth',
                            style: kHeadingTextStyle.copyWith(
                                color: Colors.blue[900]),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                await launch(
                                    'https://www.mohfw.gov.in/pdf/Advisory&ManualonuseofHomemadeProtectiveCoverforFace&Mouth.pdf');
                              })
                      ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Prevention and Management of COVID-19',
                            style: kHeadingTextStyle.copyWith(
                                color: Colors.blue[900]),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                await launch(
                                    'https://www.mohfw.gov.in/pdf/PreventionandManagementofCOVID19FLWEnglish.pdf#:~:text=About%2080%25%20of%20confirmed,pneumonia%20and%20other%20complications.');
                              })
                      ]),
                    )
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
    );
  }
}
