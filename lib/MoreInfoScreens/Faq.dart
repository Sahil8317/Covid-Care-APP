import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:covid19app/constants.dart';

class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 24,
                    color: kActiveShadowColor),
              ],
              gradient: LinearGradient(colors: [
                Color(0xFF3383CD).withOpacity(0.8),
                Color(0xFF11249F).withOpacity(0.25),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(18.0),
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
                    borderRadius: BorderRadius.all(Radius.elliptical(10, 20)),
                    gradient: LinearGradient(colors: [
                      Color(0xFF11249F).withOpacity(0.6),
                      Color(0xFF3383CD),
                    ])),
                child: GradientText('FAQs On COVID-19',
                    textAlign: TextAlign.center,
                    style: kHeadingTextStyle.copyWith(
                      fontSize: 28,
                    ),
                    gradient: Gradients.deepSpace),
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                children: <Widget>[
                  QuestionAndAnswer(
                    question:
                        'Is headache a symptom of the coronavirus disease?',
                    answer:
                        'The virus can cause a range of symptoms, from ranging from mild illness to pneumonia. Symptoms of the disease are fever, cough, sore throat and headaches.',
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  QuestionAndAnswer(
                    question:
                        'Are masks effective against the coronavirus disease?',
                    answer:
                        'If you are healthy, you only need to wear a mask if you are taking care of a person with suspected 2019-nCoV infection. Wear a mask if you are coughing or sneezing. Masks are effective only when used in combination with frequent hand-cleaning with alcohol-based hand rub or soap and water.',
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  QuestionAndAnswer(
                    question: 'Who is at risk for coronavirus?',
                    answer:
                        'The virus that causes COVID-19 infects people of all ages. However, evidence to date suggests that two groups of people are at a higher risk of getting severe COVID-19 disease. These are older people (that is people over 60 years old); and those with underlying medical conditions (such as cardiovascular disease, diabetes, chronic respiratory disease, and cancer).',
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  QuestionAndAnswer(
                    question:
                        'What is the usual body temperature in coronavirus disease patients?',
                    answer:
                        'The normal human body temperature remains around 36.5°C to 37°C, regardless of the external temperature or weather. The most effective way to protect yourself against the new coronavirus is by frequently cleaning your hands with alcohol-based hand rub or washing them with soap and water.',
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  QuestionAndAnswer(
                    question:
                        'Do people with mild symptoms need to be hospitalized?',
                    answer:
                        'No. For patients who have mild illness, e.g., low-grade fever, cough, malaise, rhinorrhoea, sore throat without any warning signs, such as shortness of breath ,increased respiratory, nausea, vomiting, and/or diarrhoea and without changes in mental status, hospitalization may not be required unless there is concern for rapid clinical deterioration.',
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  QuestionAndAnswer(
                    question: 'Is coronavirus a bacteria or virus?',
                    answer:
                        'The new coronavirus is a respiratory virus which spreads primarily through droplets generated when an infected person coughs or sneezes, or through droplets of saliva or discharge from the nose. To protect yourself, clean your hands frequently with an alcohol-based hand rub or wash them with soap and water.',
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  QuestionAndAnswer(
                    question: 'Is there a vaccine for the coronavirus disease?',
                    answer:
                        'When a disease is new, there is no vaccine until one is developed. It can take a number of years for a new vaccine to be developed.',
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}

class QuestionAndAnswer extends StatelessWidget {
  final question;
  final answer;

  QuestionAndAnswer({this.question, this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 8), blurRadius: 24, color: kActiveShadowColor)
          ],
          gradient: LinearGradient(colors: [
            Color(0xFF584284).withOpacity(0.9),
            Color(0xFFBE92F6).withOpacity(0.9),
          ])),
      child: Row(
        children: <Widget>[
          Expanded(
            child: GradientText(
              question,
              style: kHeadingTextStyle,
              gradient: Gradients.deepSpace,
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(16.0),
                    height: 370.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 9),
                              blurRadius: 24,
                              color: kActiveShadowColor)
                        ],
                        gradient: LinearGradient(colors: [
                          Color(0xFF3383CD).withOpacity(0.8),
                          Color(0xFF11249F).withOpacity(0.25),
                        ]),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0))),
                    child: Text(
                      answer,
                      style: kHeadingTextStyle.copyWith(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              );
            },
            child: SvgPicture.asset(
              'assets/icons/downward.svg',
              width: 20.0,
              fit: BoxFit.fitWidth,
            ),
          )
        ],
      ),
    );
  }
}
