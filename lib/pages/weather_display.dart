import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/pages/weather_card.dart';
import 'package:weather_app/utils/color_constant.dart';
import 'package:weather_app/utils/text_constant.dart';

import '../model/data_state.dart';

class WeatherDisplay extends StatelessWidget {
  WeatherDisplay(
      {super.key,
      required this.cityName,
      required this.maxTemp,
      required this.currentTemperature,
      required this.weatherCondition,
      required this.icon,
      required this.humidity,
      required this.windSpeed,
      required this.minTemp});

  String cityName;
  double maxTemp;
  double currentTemperature;
  String weatherCondition;
  var icon;
  double minTemp;
  int humidity;
  double windSpeed;
  final WeatherController weatherController = Get.find<WeatherController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.backgroundColor,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          title: const Text(TextConstant.weatherDisplay),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          width: Get.width,
          color: ColorConstant.backgroundColor,
          child: Column(
            children: [
              const SizedBox(
                height: 12.0,
              ),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      cityName,
                      style: const TextStyle(
                          color: ColorConstant.whiteColor,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Image.network('https:$icon')
                  ],
                ),
              ),
              const Spacer(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  TextConstant.todayForecast,
                  style: TextStyle(
                      color: ColorConstant.whiteColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: ColorConstant.textBackgroundColor,
                    ),
                    child: Center(
                      child: index == 0
                          ? WeatherCard(
                              heading: TextConstant.currentTemperature,
                              title: '${currentTemperature.toString()} C',
                            )
                          : index == 1
                              ? WeatherCard(
                                  heading: TextConstant.weatherCondition,
                                  title: weatherCondition.toString(),
                                )
                              : index == 2
                                  ? WeatherCard(
                                      heading: TextConstant.humidity,
                                      title: humidity.toString(),
                                    )
                                  : index == 3
                                      ? WeatherCard(
                                          heading: TextConstant.windSpeed,
                                          title: '${windSpeed.toString()} kph',
                                        )
                                      : index == 4
                                          ? WeatherCard(
                                              heading: TextConstant.minTemp,
                                              title: '${minTemp.toString()} C',
                                            )
                                          : WeatherCard(
                                              heading: TextConstant.maxTemp,
                                              title: '${maxTemp.toString()} C',
                                            ),
                    ),
                  );
                },
              )
              // Text(icon.toString()),
            ],
          ),
        ));
  }
}
