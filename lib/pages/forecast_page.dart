import 'package:climate/pages/daily_object.dart';
import 'package:climate/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForeCast extends StatefulWidget {
  double? lat;
  double? lon;

  ForeCast(this.lat, this.lon);

  @override
  _ForeCastState createState() => _ForeCastState();
}

class _ForeCastState extends State<ForeCast> {
  DailyOb? dailyob;

  getDaily() async {
    print(DAILY_URL +
        "?lat=${widget.lat}&lon=${widget.lon}&exclude=minutely,hourly,monthly&appid=$APPID&units=metric");
    var response = await http.get(Uri.parse(DAILY_URL +
        "?lat=${widget.lat}&lon=${widget.lon}&exclude=minutely,hourly,monthly&appid=$APPID&units=metric"));
    // print(response.body);

    List<dynamic> data = [];

    if (response.statusCode == 200) {
      setState(() {
        dailyob = DailyOb.fromJson(json.decode(response.body));
      });
    } else {
      print('error');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getDaily();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('images/img_3.png',
              fit: BoxFit.cover, height: double.infinity),
          Positioned(
            top: 40,
            left: 20,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.keyboard_backspace),
                  iconSize: 30,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 20.0),
                Text(
                  '7 Days Forecast',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                      letterSpacing: 3.0),
                ),
              ],
            ),
          ),
          Positioned(
              top: 100,
              left: 20,
              child: Text(
                dailyob!.timezone,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey[400]),
              )),
        ],
      ),
    );
  }
}
