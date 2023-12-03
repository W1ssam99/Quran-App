import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';
import 'package:http/http.dart' as http;

import '../../models/adhanModel.dart';

class AdhanTime extends StatelessWidget {
  const AdhanTime({super.key});

  @override
  Widget build(BuildContext context) {
    final AdhanModel adhanModel = AdhanModel();
    Map<String, String> prayerTimes = adhanModel.getPrayerTimes();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Fajr"),
                Text('${prayerTimes['Fajr']}'),
              ],
            )),
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text("Sunrise"),
                Text('${prayerTimes['Sunrise']}'),
              ],
            )),
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text("Dhuhr"),
                Text('${prayerTimes['Dhuhr']}'),
              ],
            )),
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text("Asr"),
                Text('${prayerTimes['Asr']}'),
              ],
            )),
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Maghrib"),
                Text('${prayerTimes['Maghrib']}'),
              ],
            )),
        Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text("Isha"),
                Text('${prayerTimes['Isha']}'),
              ],
            )),
      ],
    );
  }
}
