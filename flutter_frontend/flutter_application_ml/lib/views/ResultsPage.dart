import 'package:flutter/material.dart';
import 'package:flutter_application_ml/utilities/constants.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({
    required this.bmiResult,
  });
  final String bmiResult;
  constants c = new constants();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Result in Lakhs',
                style: c.kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: c.kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiResult,
                    style: c.kBMITextStyle,
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.green,
            margin: EdgeInsets.symmetric(
                vertical: 10.0, horizontal: 24.0),
            child: ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: Center(
                child: Text(
                  'Estimate Again',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SourceSansPro',
                    fontSize: 17.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, required this.cardChild});

  final colour;
  final cardChild;
  //final onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
