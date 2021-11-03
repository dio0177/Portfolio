import 'package:climate/pages/daily_object.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ForecastWidget extends StatelessWidget {
  Daily dailys;

  ForecastWidget(this.dailys);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: const Color.fromRGBO(11, 11, 10, 0.9),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      color: Colors.grey[200],
                      size: 20,
                    ),
                    const SizedBox(width: 15.0),
                    Expanded(
                      child: Text(
                        DateFormat("EEEE dd, MMMM")
                            .format(DateTime.fromMillisecondsSinceEpoch(
                                int.parse(dailys.dt) * 1000))
                            .toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[400],
                            letterSpacing: 2.0),
                      ),
                    ),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                        "http://openweathermap.org/img/wn/${dailys.weather[0].icon}@2x.png"),
                    Text(
                      dailys.weather[0].main,
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.grey[400]),
                    ),
                    const SizedBox(height: 13.0),
                    Text(
                      'အမြင့်ဆုံးအပူချိန် : ' + dailys.temp.max + ' °C',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey,
                          letterSpacing: 1.0),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'အနိမ့်ဆုံးအပူချိန် : ' + dailys.temp.min + ' °C',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey,
                          letterSpacing: 1.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'နေ့အပူချိန် : ' + dailys.temp.day + ' °C',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey,
                          letterSpacing: 1.0),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'ညအပူချိန် : ' + dailys.temp.night + ' °C',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey,
                          letterSpacing: 1.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'လေဖိအား : ' + dailys.pressure.toString() + ' Pa',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey,
                          letterSpacing: 1.0),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'လေတိုက်နှုန်း : ' + dailys.windSpeed.toString() + ' metre/sec',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey,
                          letterSpacing: 1.0),
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              );
            });
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              colors: [
                Colors.indigo.withOpacity(0.7),
                Colors.blue.withOpacity(0.7),
                Colors.purple.withOpacity(0.7),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
                "http://openweathermap.org/img/wn/${dailys.weather[0].icon}@2x.png"),
            Text(
              dailys.weather[0].main,
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: Colors.grey[400]),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.date_range,
                  color: Colors.grey[400],
                  size: 20,
                ),
                const SizedBox(width: 15.0),
                Text(
                  DateFormat("EEEE dd, MMMM")
                      .format(DateTime.fromMillisecondsSinceEpoch(
                          int.parse(dailys.dt) * 1000))
                      .toString(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
