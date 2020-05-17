import 'package:covid19app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class LockDownPage extends StatefulWidget {
  @override
  _LockDownPageState createState() => _LockDownPageState();
}

class _LockDownPageState extends State<LockDownPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20.0),
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 8),
                          blurRadius: 24,
                          color: kActiveShadowColor)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/lockdownpage.png'),
                        fit: BoxFit.fitWidth)),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, top: 15.0, right: 10),
                child: Text(
                  '               Currently India is in LockDown which was initiated by Prime Minister Narendra Modi limiting movement of the entire 1.3 billion population of India as a preventive measure against the COVID-19 pandemic in India.',
                  style: kSubTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 5, right: 10),
                child: Text(
                  '     LockDown was initiated on 24 March 2020 for a duration of 21 days after that for many times lockdown was extended!',
                  style: kSubTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 5, right: 10),
                child: Text(
                  'In Every Extension Of LockDown New Guildlines were provided by Ministry of Home Affairs India',
                  style: kSubTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20.0,
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
                  'GuildLines By MHA',
                  style: kHeadingTextStyle.copyWith(letterSpacing: 2),
                  textAlign: TextAlign.center,
                  gradient: Gradients.deepSpace,
                ),
              ),
              Guildliner(
                Date: '24-03-2020',
                url: 'https://mha.gov.in/sites/default/files/Guidelines.pdf',
                lockdown: 'LockDown Phase I',
              ),
              Guildliner(
                Date: '15-04-2020',
                url:
                    'https://mha.gov.in/sites/default/files/MHA%20order%20dt%2015.04.2020%2C%20with%20Revised%20Consolidated%20Guidelines_compressed%20%283%29.pdf',
                lockdown: 'LockDown Phase II',
              ),
              Guildliner(
                Date: '1-05-2020',
                url:
                    'https://mha.gov.in/sites/default/files/MHA%20Order%20Dt.%201.5.2020%20to%20extend%20Lockdown%20period%20for%202%20weeks%20w.e.f.%204.5.2020%20with%20new%20guidelines.pdf',
                lockdown: 'LockDown Phase III',
              ),
              Guildliner(
                Date: '17-05-2020',
                url:
                    'https://www.mha.gov.in/sites/default/files/MHAOrderextension_1752020.pdf',
                lockdown: 'LockDown Phase IV',
              ),
              SizedBox(height: 40.0)
            ],
          ),
        ),
      ),
    );
  }
}

class Guildliner extends StatelessWidget {
  final String Date;
  final url;
  final lockdown;
  Guildliner({this.Date, this.url, this.lockdown});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 10.0),
          child: Text(
            'Date Of Issue : $Date',
            style: kHeadingTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: lockdown,
                  style: kHeadingTextStyle.copyWith(color: Colors.blue[900]),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      launch(url);
                    })
            ]),
          ),
        ),
      ],
    );
  }
}
