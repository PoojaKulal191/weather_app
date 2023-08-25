import 'package:flutter/material.dart';
import '../utils/color_constant.dart';

class WeatherCard extends StatelessWidget {
  WeatherCard({super.key, required this.title, required this.heading});

  String heading;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: ColorConstant.textBackgroundColor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              heading,
              style: const TextStyle(
                color: ColorConstant.whiteColor,
              ),
            ),
            const SizedBox(height: 8.0,),
            Text(title,
                style: const TextStyle(
                    color: ColorConstant.whiteColor,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
