import 'package:climate/pages/daily_object.dart';
import 'package:climate/pages/forecast_widget.dart';
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
  bool isLoading = true;

  getDaily() async {
    var response = await http.get(Uri.parse(DAILY_URL +
        "?lat=${widget.lat}&lon=${widget.lon}&exclude=minutely,hourly,monthly&appid=$APPID&units=metric"));
    // print(response.body);

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
        dailyob = DailyOb.fromMap(json.decode(response.body));
      });
    } else {
      print('error');
      setState(() {
        isLoading = false;
      });
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
    int hour = DateTime.now().hour;
    bool isNight = true;
    if(hour>=5&&hour<=18){
      isNight = false;
    }
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(isNight?'images/img_13':'images/img_11.png',
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
                  icon: const Icon(Icons.keyboard_backspace),
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
            top: 120,
            left: 0,
            right: 0,
            bottom: 0,
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: dailyob!.daily.length,
                    itemBuilder: (context, index) {
                      return ForecastWidget(dailyob!.daily[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
