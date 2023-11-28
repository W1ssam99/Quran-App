import 'package:flutter/material.dart';
import 'package:quran/quran.dart';

import '../widgets/homeScreenWidget.dart';
import 'detailsScreens/surahScreen.dart';

class SurahListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: totalSurahCount,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: () {
          Navigator.push(context,   MaterialPageRoute(builder: (context) => SurahScreen(surahIndex: index + 1)),
              );
        },
        child: SurahCard(
          surahNumber: index + 1,
          surahName: ' ${getSurahName(index+1) }',
          surahType:getPlaceOfRevelation(index+1) ,
          surahAyahCount: getVerseCount(index+1),
          surahAudio: getAudioURLBySurah(index+1),

        ),
      ),
    );
  }
}

class JuzListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Juz View'),
        ),
      ],
    );
  }
}

class HizbListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Hizb View'),
        ),
      ],
    );
  }
}
