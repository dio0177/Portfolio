import 'package:climate/Object/object.dart';
import 'package:climate/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchCity extends StatefulWidget {
  @override
  _SearchCityState createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  var _searchController = TextEditingController();
  WeatherOb? weath;

  getSearch(String getName) async {
    print(getName);
    var response = await http.get(
      Uri.parse("$URL?q=$getName&appid=$APPID&units=metric"),
    );

    if (response.statusCode == 200) {
      setState(() {
        weath = WeatherOb.fromMap(
          json.decode(response.body),
        );
      });
    } else {
      print('Unauthorized');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Image.asset('images/img.png',
            fit: BoxFit.cover, height: double.infinity,width: double.infinity),
        Positioned(
          top: 30,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.keyboard_backspace),
            iconSize: 30,
            color: Colors.grey[300],
          ),
        ),
        Positioned(
            top: 60,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                              hintText: 'Search By City',
                              hintStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey[600],
                                letterSpacing: 4.5,
                              )),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                            fontSize: 20,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      IconButton(
                        onPressed: () {

                          setState(() {
                            getSearch(_searchController.text);
                            _searchController.clear();


                          });
                        },
                        icon: Icon(Icons.search),
                        iconSize: 30,
                        color: Colors.grey[400],
                      ),
                    ],
                  ),
                ),
                weath == null
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Positioned(
                          bottom: 70,
                          right: 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  weath!.main.temp.toString() + ' °C',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.grey[400],
                                      letterSpacing: 2.0),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Image.network(
                                          'http://openweathermap.org/img/wn/${weath!.weather[0].icon}@2x.png'),
                                    ),
                                    Text(
                                      weath!.weather[0].main,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[400],
                                          letterSpacing: 2.0),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 15.0),
                              Center(
                                child: Text(
                                  'City : ' +
                                      weath!.name,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0,
                                      color: Colors.grey[500]),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Center(
                                child: Text(
                                  'Wind Speed : ' +
                                      weath!.wind.speed.toString() +
                                      ' meter/second',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0,
                                      color: Colors.grey[500]),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Center(
                                child: Text(
                                  'Max Temperature : ' +
                                      weath!.main.tempMax +
                                      ' °C',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0,
                                      color: Colors.grey[500]),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Center(
                                child: Text(
                                  'Min Temperature : ' +
                                      weath!.main.tempMin +
                                      ' °C',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0,
                                      color: Colors.grey[500]),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Center(
                                child: Text(
                                  'Pressure : ' +
                                      weath!.main.pressure.toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0,
                                      color: Colors.grey[500]),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Center(
                                child: Text(
                                  'Humidity : ' +
                                      weath!.main.humidity.toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0,
                                      color: Colors.grey[500]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            ))
      ]),
    );
  }
}
