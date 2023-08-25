import 'dart:io';
import 'package:http/http.dart';
import 'package:get/get.dart' as console;

class HttpProvider{

  /// Get weather details
  getWeatherInfo(city, apiKey) async {
    try {
      return await get(
        Uri.parse('https://api.weatherapi.com/v1/forecast.json?q=$city&days=1&key=$apiKey'),
      );
    } on HttpException catch (e) {
      console.Get.log('Http Exp: ${e.runtimeType}');
    } catch (e) {
      return e.toString();
    }
  }
}