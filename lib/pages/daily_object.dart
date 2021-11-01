

// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';
//
//
// class DailyOb {
//   DailyOb({
//     required this.lat,
//     required this.lon,
//     required this.timezone,
//     required this.timezoneOffset,
//     required this.current,
//     required this.daily,
//   });
//
//   String lat;
//   double lon;
//   String timezone;
//   int timezoneOffset;
//   Current current;
//   List<Daily> daily;
//
//   factory DailyOb.fromJson(String str) => DailyOb.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory DailyOb.fromMap(Map<String, dynamic> json) => DailyOb(
//     lat: json["lat"].toString(),
//     lon: json["lon"].toDouble(),
//     timezone: json["timezone"],
//     timezoneOffset: json["timezone_offset"],
//     current: Current.fromMap(json["current"]),
//     daily: List<Daily>.from(json["daily"].map((x) => Daily.fromMap(x))),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "lat": lat,
//     "lon": lon,
//     "timezone": timezone,
//     "timezone_offset": timezoneOffset,
//     "current": current.toMap(),
//     "daily": List<dynamic>.from(daily.map((x) => x.toMap())),
//   };
// }
//
// class Current {
//   Current({
//     required this.dt,
//     required this.sunrise,
//     required this.sunset,
//     required this.temp,
//     required this.feelsLike,
//     required this.pressure,
//     required this.humidity,
//     required this.dewPoint,
//     required this.uvi,
//     required this.clouds,
//     required this.visibility,
//     required this.windSpeed,
//     required this.windDeg,
//     required this.weather,
//     required this.rain,
//   });
//
//   int dt;
//   int sunrise;
//   int sunset;
//   double temp;
//   double feelsLike;
//   int pressure;
//   int humidity;
//   double dewPoint;
//   double uvi;
//   int clouds;
//   int visibility;
//   double windSpeed;
//   int windDeg;
//   List<Weather> weather;
//   Rain rain;
//
//   factory Current.fromJson(String str) => Current.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory Current.fromMap(Map<String, dynamic> json) => Current(
//     dt: json["dt"],
//     sunrise: json["sunrise"],
//     sunset: json["sunset"],
//     temp: json["temp"].toDouble(),
//     feelsLike: json["feels_like"].toDouble(),
//     pressure: json["pressure"],
//     humidity: json["humidity"],
//     dewPoint: json["dew_point"].toDouble(),
//     uvi: json["uvi"].toDouble(),
//     clouds: json["clouds"],
//     visibility: json["visibility"],
//     windSpeed: json["wind_speed"].toDouble(),
//     windDeg: json["wind_deg"],
//     weather: List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
//     rain: Rain.fromMap(json["rain"]),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "dt": dt,
//     "sunrise": sunrise,
//     "sunset": sunset,
//     "temp": temp,
//     "feels_like": feelsLike,
//     "pressure": pressure,
//     "humidity": humidity,
//     "dew_point": dewPoint,
//     "uvi": uvi,
//     "clouds": clouds,
//     "visibility": visibility,
//     "wind_speed": windSpeed,
//     "wind_deg": windDeg,
//     "weather": List<dynamic>.from(weather.map((x) => x.toMap())),
//     "rain": rain.toMap(),
//   };
// }
//
// class Rain {
//   Rain({
//     required this.the1H,
//   });
//
//   double the1H;
//
//   factory Rain.fromJson(String str) => Rain.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory Rain.fromMap(Map<String, dynamic> json) => Rain(
//     the1H: json["1h"].toDouble(),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "1h": the1H,
//   };
// }
//
// class Weather {
//   Weather({
//     required this.id,
//     required this.main,
//     required this.description,
//     required this.icon,
//   });
//
//   int id;
//   Main? main;
//   String description;
//   Icon? icon;
//
//   factory Weather.fromJson(String str) => Weather.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory Weather.fromMap(Map<String, dynamic> json) => Weather(
//     id: json["id"],
//     main: mainValues.map![json["main"]],
//     description: json["description"],
//     icon: iconValues.map![json["icon"]],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "main": mainValues.reverse![main],
//     "description": description,
//     "icon": iconValues.reverse![icon],
//   };
// }
//
// enum Icon { THE_09_D, THE_10_D, THE_03_D }
//
// final iconValues = EnumValues({
//   "03d": Icon.THE_03_D,
//   "09d": Icon.THE_09_D,
//   "10d": Icon.THE_10_D
// });
//
// enum Main { DRIZZLE, RAIN, CLOUDS }
//
// final mainValues = EnumValues({
//   "Clouds": Main.CLOUDS,
//   "Drizzle": Main.DRIZZLE,
//   "Rain": Main.RAIN
// });
//
// class Daily {
//   Daily({
//     required this.dt,
//     required this.sunrise,
//     required this.sunset,
//     required this.moonrise,
//     required this.moonset,
//     required this.moonPhase,
//     required this.temp,
//     required this.feelsLike,
//     required this.pressure,
//     required this.humidity,
//     required this.dewPoint,
//     required this.windSpeed,
//     required this.windDeg,
//     required this.windGust,
//     required this.weather,
//     required this.clouds,
//     required this.pop,
//     required this.rain,
//     required this.uvi,
//   });
//
//   int dt;
//   int sunrise;
//   int sunset;
//   int moonrise;
//   int moonset;
//   double moonPhase;
//   Temp temp;
//   FeelsLike feelsLike;
//   int pressure;
//   int humidity;
//   double dewPoint;
//   double windSpeed;
//   int windDeg;
//   double windGust;
//   List<Weather> weather;
//   int clouds;
//   double pop;
//   double rain;
//   double uvi;
//
//   factory Daily.fromJson(String str) => Daily.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory Daily.fromMap(Map<String, dynamic> json) => Daily(
//     dt: json["dt"],
//     sunrise: json["sunrise"],
//     sunset: json["sunset"],
//     moonrise: json["moonrise"],
//     moonset: json["moonset"],
//     moonPhase: json["moon_phase"].toDouble(),
//     temp: Temp.fromMap(json["temp"]),
//     feelsLike: FeelsLike.fromMap(json["feels_like"]),
//     pressure: json["pressure"],
//     humidity: json["humidity"],
//     dewPoint: json["dew_point"].toDouble(),
//     windSpeed: json["wind_speed"].toDouble(),
//     windDeg: json["wind_deg"],
//     windGust: json["wind_gust"].toDouble(),
//     weather: List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
//     clouds: json["clouds"],
//     pop: json["pop"].toDouble(),
//     rain: json["rain"] == null ? null : json["rain"].toDouble(),
//     uvi: json["uvi"].toDouble(),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "dt": dt,
//     "sunrise": sunrise,
//     "sunset": sunset,
//     "moonrise": moonrise,
//     "moonset": moonset,
//     "moon_phase": moonPhase,
//     "temp": temp.toMap(),
//     "feels_like": feelsLike.toMap(),
//     "pressure": pressure,
//     "humidity": humidity,
//     "dew_point": dewPoint,
//     "wind_speed": windSpeed,
//     "wind_deg": windDeg,
//     "wind_gust": windGust,
//     "weather": List<dynamic>.from(weather.map((x) => x.toMap())),
//     "clouds": clouds,
//     "pop": pop,
//     "rain": rain == null ? null : rain,
//     "uvi": uvi,
//   };
// }
//
// class FeelsLike {
//   FeelsLike({
//     required this.day,
//     required this.night,
//     required this.eve,
//     required this.morn,
//   });
//
//   double day;
//   double night;
//   double eve;
//   double morn;
//
//   factory FeelsLike.fromJson(String str) => FeelsLike.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory FeelsLike.fromMap(Map<String, dynamic> json) => FeelsLike(
//     day: json["day"].toDouble(),
//     night: json["night"].toDouble(),
//     eve: json["eve"].toDouble(),
//     morn: json["morn"].toDouble(),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "day": day,
//     "night": night,
//     "eve": eve,
//     "morn": morn,
//   };
// }
//
// class Temp {
//   Temp({
//     required this.day,
//     required this.min,
//     required this.max,
//     required this.night,
//     required this.eve,
//     required this.morn,
//   });
//
//   double day;
//   double min;
//   double max;
//   double night;
//   double eve;
//   double morn;
//
//   factory Temp.fromJson(String str) => Temp.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory Temp.fromMap(Map<String, dynamic> json) => Temp(
//     day: json["day"].toDouble(),
//     min: json["min"].toDouble(),
//     max: json["max"].toDouble(),
//     night: json["night"].toDouble(),
//     eve: json["eve"].toDouble(),
//     morn: json["morn"].toDouble(),
//   );
//
//   Map<String, dynamic> toMap() => {
//     "day": day,
//     "min": min,
//     "max": max,
//     "night": night,
//     "eve": eve,
//     "morn": morn,
//   };
// }
//
// class EnumValues<T> {
//   Map<String, T>? map;
//   Map<T, String>? reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String>? get reverse {
//     if (reverseMap == null) {
//       reverseMap = map!.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }







// To parse this JSON data, do
//
//     final highOb = highObFromMap(jsonString);

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

  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  Current current;
  List<Daily> daily;

  factory DailyOb.fromJson(String str) => DailyOb.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DailyOb.fromMap(Map<String, dynamic> json) => DailyOb(
    lat: json["lat"].toDouble(),
    lon: json["lon"].toDouble(),
    timezone: json["timezone"],
    timezoneOffset: json["timezone_offset"],
    current: Current.fromMap(json["current"]),
    daily: List<Daily>.from(json["daily"].map((x) => Daily.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "lat": lat,
    "lon": lon,
    "timezone": timezone,
    "timezone_offset": timezoneOffset,
    "current": current.toMap(),
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

  int dt;
  int sunrise;
  int sunset;
  double temp;
  double feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double uvi;
  int clouds;
  int visibility;
  double windSpeed;
  int windDeg;
  List<Weather> weather;

  factory Current.fromJson(String str) => Current.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Current.fromMap(Map<String, dynamic> json) => Current(
    dt: json["dt"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
    temp: json["temp"].toDouble(),
    feelsLike: json["feels_like"].toDouble(),
    pressure: json["pressure"],
    humidity: json["humidity"],
    dewPoint: json["dew_point"].toDouble(),
    uvi: json["uvi"].toDouble(),
    clouds: json["clouds"],
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

  int dt;
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
  double pop;
  double rain;
  double uvi;

  factory Daily.fromJson(String str) => Daily.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Daily.fromMap(Map<String, dynamic> json) => Daily(
    dt: json["dt"],
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
    pop: json["pop"].toDouble(),
    rain: json["rain"] == null ? null : json["rain"].toDouble(),
    uvi: json["uvi"].toDouble(),
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
    "rain": rain == null ? null : rain,
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

  double day;
  double night;
  double eve;
  double morn;

  factory FeelsLike.fromJson(String str) => FeelsLike.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FeelsLike.fromMap(Map<String, dynamic> json) => FeelsLike(
    day: json["day"].toDouble(),
    night: json["night"].toDouble(),
    eve: json["eve"].toDouble(),
    morn: json["morn"].toDouble(),
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

  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;

  factory Temp.fromJson(String str) => Temp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Temp.fromMap(Map<String, dynamic> json) => Temp(
    day: json["day"].toDouble(),
    min: json["min"].toDouble(),
    max: json["max"].toDouble(),
    night: json["night"].toDouble(),
    eve: json["eve"].toDouble(),
    morn: json["morn"].toDouble(),
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












