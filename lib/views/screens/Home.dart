import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled5/componets/colors.dart';
import 'package:untitled5/views/screens/tabBarViews.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../componets/fonts.dart';
import '../../componets/icons.dart';
import '../widgets/homeScreenWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 1;

    void CurrentIndexIncrement(int index) {
      _currentIndex = _currentIndex + 1;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Qurran App').text.bold.color(mainColor).make(),
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 4.0, top: 10, bottom: 10, right: 10),
            child: SvgPicture.asset(
              menuIco,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: SvgPicture.asset(searchICo),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Container(
               height:  MediaQuery.of(context).size.height*0.1,
                  child: UserView()),
              10.heightBox,
               Container(
                height:  MediaQuery.of(context).size.height*0.16,
                  child: LastRead()),
              10.heightBox,
              Container(
                height: MediaQuery.of(context).size.height*0.61,
                  child: MyTabBar())
            ],
          ),
        ),
      ),
    );
  }
}
