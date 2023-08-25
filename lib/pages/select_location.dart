import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:weather_app/utils/color_constant.dart';
import 'package:weather_app/utils/enum.dart';
import '../controller/weather_controller.dart';
import '../service/state_services.dart';
import '../utils/text_constant.dart';

class SelectLocation extends StatelessWidget {
  const SelectLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController = Get.find<WeatherController>();
    weatherController.controller.clear();
    return Scaffold(
      body: Container(
        color: ColorConstant.backgroundColor,
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
            child: Column(
              children: [
                TypeAheadField(
                  suggestionsCallback: (value) {
                    return StateService.getSuggestions(value);
                  },
                  itemBuilder: (context, String suggestion) {
                    return Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              suggestion,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.white, fontSize: 18.0),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                  onSuggestionSelected: (String suggestion) {
                    weatherController.userSelected!.value = suggestion;
                    weatherController.controller.text =
                        weatherController.userSelected!.value;
                    weatherController
                        .getWeatherInfo(weatherController.controller.text);
                  },
                  suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                    color: ColorConstant.textBackgroundColor,
                    elevation: 4.0,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  textFieldConfiguration: TextFieldConfiguration(
                    style: const TextStyle(color: Colors.white),
                    controller: weatherController.controller,
                    decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                          15.0,
                        )),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: TextConstant.search,
                        contentPadding: const EdgeInsets.only(top: 4, left: 10),
                        hintStyle:
                            const TextStyle(color: Colors.white, fontSize: 18),
                        suffixIcon: IconButton(
                            onPressed: () {
                              weatherController.getWeatherInfo(
                                  weatherController.controller.text);
                            },
                            icon:
                                const Icon(Icons.search, color: Colors.white)),
                        fillColor: ColorConstant.textBackgroundColor,
                        filled: true),
                  ),
                ),
                Obx(
                  () {
                    switch (weatherController.weather.value.type!) {
                      case DataStateType.data:
                        return Expanded(
                          child: Text(weatherController.controller.text),
                        );
                      case DataStateType.loading:
                        return const Expanded(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: ColorConstant.whiteColor,
                            ),
                          ),
                        );
                      case DataStateType.error:
                        return const Expanded(
                          child: Center(
                            child: Text(
                              TextConstant.noMatchingLocation,
                              style: TextStyle(
                                  color: ColorConstant.whiteColor,
                                  fontSize: 20.0),
                            ),
                          ),
                        );
                      case DataStateType.idle:
                        return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
