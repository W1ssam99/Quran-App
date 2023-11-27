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
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserView(),
            20.heightBox,
            LastRead(),
            20.heightBox,
           DefaultTabController(
  length: 4,
  child: Column(
    children: [
      TabBar(
        labelColor: mainColor,
        unselectedLabelColor: secondaryColor,
        indicatorColor: mainColor,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          Tab(
            child: Text(
              "Surah",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Tab(
            child: Text(
              "Para",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Tab(
            child: Text(
              "Juz",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Tab(
            child: Text(
              "Hizb",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      Container(
        height: 300,
        child: TabBarView(
          children: [
            SurahListView(), // Replace with your Surah list view widget
            ParaListView(), // Replace with your Para list view widget
            JuzListView(), // Replace with your Juz list view widget
            HizbListView(), // Replace with your Hizb list view widget
          ],
        ),
      )
    ],
  ),
),
          ],
        ),
      ),
    );
  }
}
