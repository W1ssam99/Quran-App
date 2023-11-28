import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:quran/quran.dart' as quran;
import '../../componets/colors.dart';
import '../../componets/icons.dart';
import '../screens/tabBarViews.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.heightBox,
        Text("Asslamualaikum",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: secondaryColor,
            )),
        3.heightBox,
        Text("UserName",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: mainColor,
            )),
      ],
    );
  }
}

class LastRead extends StatelessWidget {
  const LastRead({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.16,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.71, -0.71),
          end: Alignment(-0.71, 0.71),
          colors: const [Color(0xFFDF98FA), Color(0xFF9055FF)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SvgPicture.asset(
                    quranIco,
                    height: 30,
                    width: 30,
                  ),
                  10.widthBox,
                  Text("Last Read",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )),
                ]),
                10.heightBox,
                Text("Al-Baqarah",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    )),
                10.heightBox,
                Text("Ayah 1-5",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [SvgPicture.asset(quranPhoto)],
          )
        ],
      ),
    );
  }
}

class SurahCard extends StatelessWidget {
  late int surahNumber;
  late String surahName;
  late String surahType;
  late int surahAyahCount;
  late var surahAudio;

  SurahCard({
    super.key,
    required this.surahNumber,
    required this.surahName,
    required this.surahType,
    required this.surahAyahCount,
    required this.surahAudio,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            child: Stack(
              children: [
                Center(
                    child: Text("${surahNumber}",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ))),
                Container(
                  height: 50,
                  width: 50,
                  child: SvgPicture.asset(muslimIco),
                ),
              ],
            ),
          ),
          10.widthBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${surahName}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )),
              Text("${surahType}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )),
            ],
          ),
          Spacer(),
          Text("${surahAyahCount}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}

class JuzCard extends StatelessWidget {
  late int juzNumber;
  late int juzName;

  JuzCard({super.key, required this.juzName, required this.juzNumber, t});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            child: Stack(
              children: [
                Center(
                    child: Text("${juzNumber}",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ))),
                Container(
                  height: 50,
                  width: 50,
                  child: SvgPicture.asset(muslimIco),
                ),
              ],
            ),
          ),
          10.widthBox,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${juzName}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            labelColor: mainColor,
            unselectedLabelColor: secondaryColor,
            indicatorColor: mainColor,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: const [
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
            height: MediaQuery.of(context).size.height * 0.553,
            child: TabBarView(
              children: [
                SurahListView(), // Replace with your Surah list view widget
                JuzListView(), // Replace with your Juz list view widget
                HizbListView(), // Replace with your Hizb list view widget
              ],
            ),
          )
        ],
      ),
    );
  }
}
