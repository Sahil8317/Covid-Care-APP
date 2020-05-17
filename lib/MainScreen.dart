import 'package:covid19app/HealthCarePage.dart';
import 'package:covid19app/LoadingScreenInfra.dart';
import 'package:covid19app/LoadingScreenVirus.dart';
import 'package:covid19app/LoadingScreenhelpline.dart';
import 'package:covid19app/MoreCovidDataScreen.dart';
import 'package:covid19app/MoreInfoScreens/StayHome.dart';
import 'package:covid19app/PreventionScreens/CoverYourCough.dart';
import 'package:covid19app/PreventionScreens/RegularCheckup.dart';
import 'package:covid19app/PreventionScreens/WearMaskScreen.dart';
import 'package:covid19app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'CovidDataScreen.dart';
import 'PreventionScreens/SocialDistance.dart';
import 'MoreInfoScreens/Helpline.dart';
import 'MoreInfoScreens/Lockdown.dart';
import 'MoreInfoScreens/Faq.dart';
import 'PreventionScreens/WashYourHands.dart';

class MainScreenCovid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 300.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0)),
                  color: kPrimaryColor,
                  gradient: LinearGradient(
                      colors: [Color(0xFF3383CD), Color(0xFF11249F)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft),
                  image: DecorationImage(
                      image: AssetImage('assets/images/newgreencorona.png')),
                ),
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Text(
                        'COVID 19',
                        style: kHeadingTextStyle.copyWith(
                          fontSize: 46,
                          color: Colors.grey[200],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Coronavirus disease (COVID-19) is an infectious disease caused by a '
                      'newly discovered coronavirus.',
                      style: KTitleTextStyle.copyWith(color: Colors.grey[350]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 17.0),
                    child: Text(
                      'Symptoms Of COVID 19',
                      style: KTitleTextStyle.copyWith(fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    height: 137.0,
                    child: Padding(
                      padding: EdgeInsets.only(left: 17.0, right: 17.0),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          ReusableContainer(
                            ImageName: 'assets/images/circlecroppedfever.png',
                            SymptomName: 'Fever',
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          ReusableContainer(
                            ImageName: 'assets/images/headachenew.png',
                            SymptomName: 'Headache',
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          ReusableContainer(
                            ImageName: 'assets/images/cough.png',
                            SymptomName: 'Cough',
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          ReusableContainer(
                            ImageName: 'assets/images/sorethroat.png',
                            SymptomName: 'Sore Throat',
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          ReusableContainer(
                            ImageName: 'assets/images/shortnessofbreath.png',
                            SymptomName: 'Dyspnea',
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(17.0),
                    child: Text(
                      'Prevention',
                      style: KTitleTextStyle.copyWith(fontSize: 25.0),
                    ),
                  ),
                  PreventionContainer(
                    PreventionImage: 'assets/images/wearmasknew.png',
                    PreventionName: 'Wear Face Mask',
                    PreventionDetail:
                        'Since the outbreak of Covid-19 mask is necessary to avoid the spread of virus.',
                    NameOfPage: WearMaskPage(),
                  ),
                  PreventionContainer(
                    PreventionImage: 'assets/images/washHands.png',
                    PreventionName: 'Wash Your Hands',
                    PreventionDetail:
                        'Washing your hands with soup or sanitizer(contain alcohol) can keep you safe.',
                    NameOfPage: WashHandsPage(),
                  ),
                  PreventionContainer(
                    PreventionImage: 'assets/images/covermouth.png',
                    PreventionName: 'Cover Your Cough',
                    PreventionDetail:
                        'Always cover your mouth while sneezing or caughing to avoid the spread of virus.',
                    NameOfPage: CoverYourCoughPage(),
                  ),
                  PreventionContainer(
                    PreventionImage: 'assets/images/socialdistancing.png',
                    PreventionName: 'Social Distancing',
                    PreventionDetail:
                        'To be safe we should follow social distancing and have a distance of atleast 1m',
                    NameOfPage: SocialDistancingPage(),
                  ),
                  PreventionContainer(
                    PreventionImage: 'assets/images/doctorvisit.png',
                    PreventionName: 'Regular Checkup',
                    PreventionDetail:
                        'You must have a regular check-up if you find any of symptoms of covid-19.',
                    NameOfPage: RegularCheckupPage(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 17.0, bottom: 17.0),
                    child: Text(
                      'Spread Of Virus',
                      style: KTitleTextStyle.copyWith(fontSize: 25.0),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoadingpageVirus()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 17.0, right: 17.0),
                      height: 130.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 8),
                              blurRadius: 24,
                              color: kActiveShadowColor),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/finalworldmap.png',
                          ),
                          Text(
                            'See Details',
                            style: KTitleTextStyle.copyWith(fontSize: 18.0),
                          ),
                          SizedBox(
                            width: 12.0,
                          ),
                          SvgPicture.asset(
                            'assets/icons/forward.svg',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 17.0),
                    child: Text(
                      'Health Infrastructure',
                      style: KTitleTextStyle.copyWith(fontSize: 25.0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    margin: EdgeInsets.only(left: 17.0, right: 17.0),
                    height: 120.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 8),
                            blurRadius: 24,
                            color: kActiveShadowColor)
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/hospital.png',
                        ),
                        SizedBox(
                          width: 60.0,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LoadingPageInfra()));
                            },
                            child: Text(
                              'See Details',
                              textAlign: TextAlign.end,
                              style:
                                  KTitleTextStyle.copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        SvgPicture.asset(
                          'assets/icons/forward.svg',
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 17.0),
                    child: Text(
                      'More About Covid-19',
                      style: KTitleTextStyle.copyWith(fontSize: 25.0),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 17.0),
                    child: Row(
                      children: <Widget>[
                        MoreInfo(
                          Imagename: 'assets/images/newvaccine.png',
                          NameofInfo: 'Vaccine',
                          NameOfPage: SocialDistancingPage(),
                        ),
                        MoreInfo(
                          Imagename: 'assets/images/lockdown.png',
                          NameofInfo: 'LockDown',
                          NameOfPage: LockDownPage(),
                        ),
                        MoreInfo(
                          Imagename: 'assets/images/stayhome.png',
                          NameofInfo: 'StayHome',
                          NameOfPage: StayHomePage(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: <Widget>[
                        MoreInfo(
                          Imagename: 'assets/images/helpline.png',
                          NameofInfo: 'Helpline',
                          NameOfPage: helplineLoadingPage(),
                        ),
                        SizedBox(
                          width: 7.0,
                        ),
                        MoreInfo(
                          Imagename: 'assets/images/FAQ.png',
                          NameofInfo: 'FAQs On Covid-19',
                          NameOfPage: FAQ(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: Image.asset('assets/images/thanks.png',
                    width: 260.0, fit: BoxFit.fitWidth),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MoreInfo extends StatelessWidget {
  final String Imagename;
  final String NameofInfo;
  final NameOfPage;
  MoreInfo({this.Imagename, this.NameofInfo, this.NameOfPage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NameOfPage));
      },
      child: Column(
        children: <Widget>[
          Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 300,
                    color: kActiveShadowColor),
              ],
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Image.asset(
              Imagename,
            ),
          ),
          Text(
            NameofInfo,
            style: kHeadingTextStyle.copyWith(fontSize: 17.0),
          ),
        ],
      ),
    );
  }
}

class PreventionContainer extends StatelessWidget {
  final String PreventionImage;
  final String PreventionName;
  final String PreventionDetail;
  final NameOfPage;
  PreventionContainer(
      {this.PreventionImage,
      this.PreventionName,
      this.PreventionDetail,
      this.NameOfPage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NameOfPage));
      },
      child: Container(
        margin: EdgeInsets.only(left: 17.0, right: 17.0, bottom: 17.0),
        height: 120.0,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            border: Border.all(color: Colors.black),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 8),
                  blurRadius: 24,
                  color: kActiveShadowColor)
            ],
            gradient: LinearGradient(colors: [
              Color(0xFF11249F).withOpacity(0.65),
              Color(0xFF3383CD).withOpacity(0.001),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: CircleAvatar(
                child: Image.asset(PreventionImage),
                radius: 45.0,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 190,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        PreventionName,
                        style: kHeadingTextStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        PreventionDetail,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SvgPicture.asset('assets/icons/forward.svg')
          ],
        ),
      ),
    );
  }
}

class ReusableContainer extends StatelessWidget {
  final String ImageName;
  final String SymptomName;

  ReusableContainer({this.ImageName, this.SymptomName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(4.0),
          width: 120.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF3383CD).withOpacity(0.8),
                Color(0xFF11249F).withOpacity(0.1)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              border: Border.all(color: Colors.white),
              boxShadow: [
                BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 3,
                    spreadRadius: 1,
                    color: kActiveShadowColor),
              ],
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: CircleAvatar(radius: 50.0, child: Image.asset(ImageName)),
        ),
        Expanded(
          child: Text(
            SymptomName,
            style: KTitleTextStyle.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
