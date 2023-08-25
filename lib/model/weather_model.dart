import 'dart:convert';

class WeatherModel {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeatherModel({
    this.location,
    this.current,
    this.forecast,
  });

  factory WeatherModel.fromRawJson(String str) => WeatherModel.fromJson(json.decode(str));


  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    location: Location.fromJson(json["location"]),
    current: Current.fromJson(json["current"]),
    forecast: Forecast.fromJson(json["forecast"]),
  );

}

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  Condition? condition;
  int? humidity;
  double? wind_kph;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.condition,
    this.humidity,
    this.wind_kph,
  });

  factory Current.fromRawJson(String str) => Current.fromJson(json.decode(str));

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    lastUpdatedEpoch: json["last_updated_epoch"],
    lastUpdated: json["last_updated"],
    tempC: json["temp_c"],
    tempF: json["temp_f"].toDouble(),
    condition: Condition.fromJson(json["condition"]),
    humidity: json["humidity"],
    wind_kph: json["wind_kph"],
  );

}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });

  factory Condition.fromRawJson(String str) => Condition.fromJson(json.decode(str));


  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
    text: json["text"],
    icon: json["icon"],
    code: json["code"],
  );

}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({
    this.forecastday,
  });

  factory Forecast.fromRawJson(String str) => Forecast.fromJson(json.decode(str));


  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
    forecastday: List<Forecastday>.from(json["forecastday"].map((x) => Forecastday.fromJson(x))),
  );

}

class Forecastday {
  DateTime? date;
  int? dateEpoch;
  Day? day;

  Forecastday({
    this.date,
    this.dateEpoch,
    this.day,
  });

  factory Forecastday.fromRawJson(String str) => Forecastday.fromJson(json.decode(str));


  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
    date: DateTime.parse(json["date"]),
    dateEpoch: json["date_epoch"],
    day: Day.fromJson(json["day"]),
  );

}

class Day {
  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;

  Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
  });

  factory Day.fromRawJson(String str) => Day.fromJson(json.decode(str));


  factory Day.fromJson(Map<String, dynamic> json) => Day(
    maxtempC: json["maxtemp_c"],
    maxtempF: json["maxtemp_f"].toDouble(),
    mintempC: json["mintemp_c"].toDouble(),
    mintempF: json["mintemp_f"].toDouble(),
  );

}

class Location {
  String? name;
  String? region;
  String? country;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));


  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    region: json["region"],
    country: json["country"],
    tzId: json["tz_id"],
    localtimeEpoch: json["localtime_epoch"],
    localtime: json["localtime"],
  );
}
