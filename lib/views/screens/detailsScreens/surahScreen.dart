import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/quran.dart';
import 'package:untitled5/componets/colors.dart';
import 'package:untitled5/componets/icons.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:route_transitions/route_transitions.dart';
import '../../widgets/detailWidget/audioWidget.dart';

class SurahScreen extends StatefulWidget {
  final int surahIndex;

  const SurahScreen({super.key, required this.surahIndex});

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  @override
  Widget build(BuildContext context) {
    int index = 1;
    AudioPlayer _audioPlayer = AudioPlayer();
    bool _isPlaying = false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Surah Screen'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_downward,
              color: mainColor,
            ),
          )
        ],
      ),
      body: Column(children: [
        50.heightBox,
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.38,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    homeIco,
                    color: Colors.white,
                    height: 100,
                    width: 100,
                  ),
                ),
                10.heightBox,
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    child: SvgPicture.asset(
                      quranPhoto,
                      width: 100,
                      height: 100,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        20.heightBox,
        MyAudioPlayer(surahIndex: widget.surahIndex,),
      ]),
    );
  }
}
