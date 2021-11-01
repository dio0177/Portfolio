import 'package:climate/Object/object.dart';
import 'package:climate/pages/forecast_page.dart';
import 'package:climate/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'search_city.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherOb? weath;
  bool isLoading = true;
  Location location = Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  double? lat;
  double? lon;

  getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    // print(_locationData.latitude);
    // print(_locationData.longitude);
    lat = _locationData.latitude;
    lon = _locationData.longitude;

    var response = await http.get(
      Uri.parse(URL+"?lat=$lat&lon=$lon&appid=$APPID&units=metric"),
    );
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        weath = WeatherOb.fromMap(json.decode(response.body));
        isLoading = false;
      });
    } else {
      print('error');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading?Center(child: CircularProgressIndicator()):Scaffold(
        // appBar: AppBar(
        //   title: Text('Weather App'),
        //   centerTitle: true,
        // ),
      drawer: Drawer(),
        body: Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset('images/img_3.png',fit: BoxFit.cover,height: double.infinity),
          Positioned(
            top: 60,
            left: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weath!.name,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                      letterSpacing: 3.0),
                ),
                SizedBox(height: 13.0),
                Text(
                  DateFormat("EEEE dd, MMMM, yyyy").format(DateTime.now()),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                      letterSpacing: 2.0),
                ),
                SizedBox(height: 13.0),
                Text(
                  DateFormat().add_jm().format(DateTime.now()),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey[400],
                      letterSpacing: 2.0),
                ),
                SizedBox(height: 15.0),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return ForeCast(lat,lon);
                    }));
                  },
                  child: Text('7 Days Forecast',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                    decoration: TextDecoration.underline),),),
              ],
            ),
          ),
          Positioned(
              bottom: 70,
              right: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    weath!.main.temp.toString()+ ' °C',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.grey[400],
                        letterSpacing: 2.0),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        child: Image.network(
                            'http://openweathermap.org/img/wn/${weath!.weather[0].icon}@2x.png'),
                      ),
                      Text(
                        weath!.weather[0].main,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400],
                            letterSpacing: 2.0),
                      ),
                    ],
                  )
                ],
              ),),
          Positioned(
            height: 150,
            right: 30,
            child: IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return SearchCity();
              }),);
            },
              icon: Icon(Icons.search),iconSize: 30,color: Colors.grey[400],),),
        ],
      ),
    ));
  }
}
