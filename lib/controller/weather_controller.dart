import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weather_app/pages/weather_display.dart';
import 'package:weather_app/utils/api_key.dart';
import 'package:weather_app/utils/text_constant.dart';
import '../model/data_state.dart';
import '../model/weather_model.dart';
import '../service/http_provider.dart';

class WeatherController extends GetxController {
  Rx<DataState<WeatherModel>> weather = DataState<WeatherModel>.idle().obs;
  RxString? userSelected = ''.obs;
  final TextEditingController controller = TextEditingController();

  /// Get weather data
  getWeatherInfo(city) async {
    weather.value = DataState.loading();
    await HttpProvider().getWeatherInfo(city, ApiKey.key).then(
      (value) async {
        try {
          if (value.statusCode == 200) {
            weather.value =
                DataState.data(data: WeatherModel.fromRawJson(value.body));
            String city = weather.value.data!.location!.name!;
            double currentTemperature = weather.value.data!.current!.tempC!;
            String weatherCondition =
                weather.value.data!.current!.condition!.text!;
            var icon = weather.value.data!.current!.condition!.icon!;
            double minTemp =
                weather.value.data!.forecast!.forecastday![0].day!.mintempC!;
            double maxTemp =
                weather.value.data!.forecast!.forecastday![0].day!.maxtempC!;
            int humidity = weather.value.data!.current!.humidity!;
            double windSpeed = weather.value.data!.current!.wind_kph!;

            Get.to(() => WeatherDisplay(
                  cityName: city,
                  maxTemp: maxTemp,
                  currentTemperature: currentTemperature,
                  weatherCondition: weatherCondition,
                  icon: icon,
                  minTemp: minTemp,
                  humidity: humidity,
                  windSpeed: windSpeed,
                ));
          } else {
            weather.value = DataState.error(message: TextConstant.cityName);
          }
        } catch (e) {
          return e.toString();
        }
      },
    );
  }
}
