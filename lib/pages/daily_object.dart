
// // To parse this JSON data, do
// //
// //     final highOb = highObFromMap(jsonString);
//
import 'package:climate/Object/object.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class DailyOb {
  DailyOb({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.daily,
  });

  String lat;
  String lon;
  String timezone;
  String timezoneOffset;
  Current current;
  List<Daily> daily;

  factory DailyOb.fromJson(String str) => DailyOb.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DailyOb.fromMap(Map<String, dynamic> json) => DailyOb(
    lat: json["lat"].toString(),
    lon: json["lon"].toString(),
    timezone: json["timezone"].toString(),
    timezoneOffset: json["timezone_offset"].toString(),
    current: Current.fromMap(json["current"]),
    daily: List<Daily>.from(json["daily"].map((x) => Daily.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "lat": lat,
    "lon": lon,
    "timezone": timezone,
    "timezone_offset": timezoneOffset,
    "current": current,
    "daily": List<dynamic>.from(daily.map((x) => x.toMap())),
  };
}

class Current {
  Current({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.weather,
  });

  String dt;
  String sunrise;
  String sunset;
  String temp;
  String feelsLike;
  String pressure;
  int humidity;
  double dewPoint;
  double uvi;
  String clouds;
  int visibility;
  double windSpeed;
  int windDeg;
  List<Weather> weather;

  factory Current.fromJson(String str) => Current.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Current.fromMap(Map<String, dynamic> json) => Current(
    dt: json["dt"].toString(),
    sunrise: json["sunrise"].toString(),
    sunset: json["sunset"].toString(),
    temp: json["temp"].toString(),
    feelsLike: json["feels_like"].toString(),
    pressure: json["pressure"].toString(),
    humidity: json["humidity"],
    dewPoint: json["dew_point"].toDouble(),
    uvi: json["uvi"].toDouble(),
    clouds: json["clouds"].toString(),
    visibility: json["visibility"],
    windSpeed: json["wind_speed"].toDouble(),
    windDeg: json["wind_deg"],
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "dt": dt,
    "sunrise": sunrise,
    "sunset": sunset,
    "temp": temp,
    "feels_like": feelsLike,
    "pressure": pressure,
    "humidity": humidity,
    "dew_point": dewPoint,
    "uvi": uvi,
    "clouds": clouds,
    "visibility": visibility,
    "wind_speed": windSpeed,
    "wind_deg": windDeg,
    "weather": List<dynamic>.from(weather.map((x) => x.toMap())),
  };
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  int id;
  String main;
  String description;
  String icon;

  factory Weather.fromJson(String str) => Weather.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
    id: json["id"],
    main: json["main"],
    description: json["description"],
    icon: json["icon"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "main": main,
    "description": description,
    "icon": icon,
  };
}

class Daily {
  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.rain,
    required this.uvi,
  });

  String dt;
  int sunrise;
  int sunset;
  int moonrise;
  int moonset;
  double moonPhase;
  Temp temp;
  FeelsLike feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double windSpeed;
  int windDeg;
  double windGust;
  List<Weather> weather;
  int clouds;
  String pop;
  String rain;
  String uvi;

  factory Daily.fromJson(String str) => Daily.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Daily.fromMap(Map<String, dynamic> json) => Daily(
    dt: json["dt"].toString(),
    sunrise: json["sunrise"],
    sunset: json["sunset"],
    moonrise: json["moonrise"],
    moonset: json["moonset"],
    moonPhase: json["moon_phase"].toDouble(),
    temp: Temp.fromMap(json["temp"]),
    feelsLike: FeelsLike.fromMap(json["feels_like"]),
    pressure: json["pressure"],
    humidity: json["humidity"],
    dewPoint: json["dew_point"].toDouble(),
    windSpeed: json["wind_speed"].toDouble(),
    windDeg: json["wind_deg"],
    windGust: json["wind_gust"].toDouble(),
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
    clouds: json["clouds"],
    pop: json["pop"].toString(),
    // rain: json["rain"] == null ? null : json["rain"].to,
    rain: json["rain"].toString(),
    uvi: json["uvi"].toString(),
  );

  Map<String, dynamic> toMap() => {
    "dt": dt,
    "sunrise": sunrise,
    "sunset": sunset,
    "moonrise": moonrise,
    "moonset": moonset,
    "moon_phase": moonPhase,
    "temp": temp.toMap(),
    "feels_like": feelsLike.toMap(),
    "pressure": pressure,
    "humidity": humidity,
    "dew_point": dewPoint,
    "wind_speed": windSpeed,
    "wind_deg": windDeg,
    "wind_gust": windGust,
    "weather": List<dynamic>.from(weather.map((x) => x.toMap())),
    "clouds": clouds,
    "pop": pop,
    // "rain": rain == null ? null : rain,
    "rain": rain,
    "uvi": uvi,
  };
}

class FeelsLike {
  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  String day;
  String night;
  String eve;
  String morn;

  factory FeelsLike.fromJson(String str) => FeelsLike.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FeelsLike.fromMap(Map<String, dynamic> json) => FeelsLike(
    day: json["day"].toString(),
    night: json["night"].toString(),
    eve: json["eve"].toString(),
    morn: json["morn"].toString(),
  );

  Map<String, dynamic> toMap() => {
    "day": day,
    "night": night,
    "eve": eve,
    "morn": morn,
  };
}

class Temp {
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  String day;
  String min;
  String max;
  String night;
  String eve;
  String morn;

  factory Temp.fromJson(String str) => Temp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Temp.fromMap(Map<String, dynamic> json) => Temp(
    day: json["day"].toString(),
    min: json["min"].toString(),
    max: json["max"].toString(),
    night: json["night"].toString(),
    eve: json["eve"].toString(),
    morn: json["morn"].toString(),
  );

  Map<String, dynamic> toMap() => {
    "day": day,
    "min": min,
    "max": max,
    "night": night,
    "eve": eve,
    "morn": morn,
  };
}












