import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:covid19app/constants.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class WearMaskPage extends StatefulWidget {
  @override
  _WearMaskPageState createState() => _WearMaskPageState();
}

class _WearMaskPageState extends State<WearMaskPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 260.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 8),
                          blurRadius: 24,
                          color: kActiveShadowColor),
                    ],
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0)),
                    gradient: LinearGradient(colors: [
                      Color(0xFF3383CD).withOpacity(0.6),
                      Color(0xFF11249F).withOpacity(0.30),
                    ]),
                    image: DecorationImage(
                        alignment: Alignment.bottomLeft,
                        image: AssetImage('assets/images/wearmaskgirl.png'))),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Text(
                      'WEAR MASK \nSTAY SAFE!',
                      style: kHeadingTextStyle.copyWith(
                          fontSize: 26, letterSpacing: 2),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
                child: Text(
                  'A face covering can include anything that covers your nose and mouth, including dust masks, scarves and bandanas.',
                  style: kSubTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 5),
                child: Text(
                  'Do not use health care worker masks, such as the N95 masks - those should be preserved for healthcare workers.',
                  style: kSubTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5),
                child: Text(
                  'It is important that you wear these face coverings or masks in situations where it is difficult to maintain a social distance of six feet from others. For example, in a pharmacy or grocery store.',
                  style: kSubTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.all(8),
                height: 50.0,
                width: MediaQuery.of(context).size.width * 0.60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)),
                    gradient: LinearGradient(colors: [
                      Color(0xFF584284).withOpacity(0.8),
                      Color(0xFFBE92F6).withOpacity(0.9),
                    ])),
                child: GradientText(
                  'Advisory',
                  style: kHeadingTextStyle.copyWith(letterSpacing: 2),
                  gradient: Gradients.deepSpace,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Wear a Mask in Public',
                        style: kHeadingTextStyle.copyWith(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await launch(
                                'https://www.mass.gov/news/wear-a-mask-in-public');
                          })
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 3),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text:
                            'Advice for the public: When and how to use masks',
                        style: kHeadingTextStyle.copyWith(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await launch(
                                'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/when-and-how-to-use-masks');
                          })
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 3),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'How to put on, use'
                            'take off and dispose'
                            'of a mask',
                        style: kHeadingTextStyle.copyWith(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await launch(
                                'https://www.who.int/docs/default-source/epi-win/how-to-use-mask-v0-1-print.pdf?sfvrsn=64ba1493_2');
                          })
                  ]),
                ),
              ),
              SizedBox(
                height: 35,
              )
            ],
          ),
        ),
      ),
    );
  }
}
