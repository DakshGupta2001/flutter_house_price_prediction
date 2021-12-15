import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'ResultsPage.dart';

// import 'package:flutterapp/views/result.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen(
      {required this.area,
      required this.bhk,
      required this.bathroom,
      required this.location,
      required this.balcony});

  final int area;
  final int bhk;
  final int bathroom;
  final String location;
  final int balcony;

  @override
  _LoadingScreenState createState() =>
      _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("going to call getestimate");
    setState(() {
      final int area = widget.area;
      final int bhk = widget.bhk;
      final int bathroom = widget.bathroom;
      final String location = widget.location;
      final int balcony = widget.balcony;

      getEstimate(area, bhk, bathroom, location,balcony);
    });
  }

  Future getEstimate(int area, int bhk, int bathroom,
      String location,int balcony) async {
    print("1************");
    try {
      print("try++++++++++");
      final response = await http.get(Uri.parse(
          'http://10.0.2.2:5000/predict_price?location=$location&sqft=$area&bhk=$bhk&bath=$bathroom&balcony=$balcony'));
      print("api parsed sucessfully");
      if (response.statusCode == 200) {
        print("2***********");
        var data = response.body;
        var decodedata = jsonDecode(data);
        print(decodedata['estimated_price']);
        String ans =
            decodedata['estimated_price'].toString();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ResultsPage(bmiResult: ans)),
        );
        return decodedata['estimated_price'];
      } else {
        print("3++++++++++++++++++");
        print(response.statusCode);
      }
    } catch (e) {
      print("in catch ");
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.blue,
          size: 100.0,
        ),
      ),
    );
  }
}
