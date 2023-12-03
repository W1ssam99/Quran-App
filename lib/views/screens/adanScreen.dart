import 'dart:async';
import 'dart:convert';
import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled5/componets/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../componets/Lists.dart';
import '../../componets/images.dart';
import '../../models/adhanModel.dart';
import '../widgets/adanScreenWidgets.dart';

class AdanScreen extends StatefulWidget {
  const AdanScreen({super.key});

  @override
  _AdanScreenState createState() => _AdanScreenState();
}

class _AdanScreenState extends State<AdanScreen> {
  DateTime now = DateTime.now();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.444,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(purpleDecor),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("Date: ${now.day}/${now.month}/${now.year}")
                            .text
                            .white
                            .bold
                            .size(20)
                            .make()),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child:
                          Text("Tripoli,Libya").text.white.bold.size(17).make(),
                    ),
                    SizedBox(height: 50),
                    Text('${now.hour}:${now.minute}:${now.second}')
                        .text
                        .white
                        .bold
                        .size(30)
                        .make(),
                    Expanded(child: AdhanTime()),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text("All Featuras").text.black.bold.size(20).make()),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.12,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.pushNamed(context, '/quran');
                    } else if (index == 1) {
                      Navigator.pushNamed(context, '/qibla');
                    } else if (index == 2) {
                      Navigator.pushNamed(context, '/hadith');
                    }
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.28,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Image.asset(AllfeaturesIcons[index],height: 50,width: 50,),
                      ALlfeatures[index].text.white.bold.size(20).make(),
                    ],
                    ),
                  ),
                ),
              );
            })
          )
        ],
      ),
    ));
  }
}
