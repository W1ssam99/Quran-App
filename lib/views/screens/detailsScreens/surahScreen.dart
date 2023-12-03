import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran/quran.dart';
import 'package:untitled5/componets/colors.dart';
import 'package:untitled5/componets/icons.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../componets/images.dart';
import '../../widgets/detailWidget/audioWidget.dart';
import '../../widgets/surahscreenWidjet.dart';

class SurahScreen extends StatefulWidget {
  final int surahIndex;

  const SurahScreen({Key? key, required this.surahIndex}) : super(key: key);

  @override
  _SurahScreenState createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getSurahName(widget.surahIndex)),
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
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
                    ),
                  ],
                ),
              ),
            ),
            20.heightBox,
            MyAudioPlayer(
              surahIndex: widget.surahIndex,
            ),
            20.heightBox,
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // Make the container fullscreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullScreenContainer(
                          surahIndex: widget.surahIndex,
                        ),
                      ),
                    );
                  },
                  child: IconButton(
                    onPressed: () {
                      // Make the container fullscreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullScreenContainer(
                            surahIndex: widget.surahIndex,
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.arrow_downward, color: mainColor),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 1,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        quranPhoto,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DynamicHeightContainer(
                    surahIndex: widget.surahIndex,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FullScreenContainer extends StatelessWidget {
  final int surahIndex;

  const FullScreenContainer({required this.surahIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              quranPhoto,
            ),
          ),
        ),
        child: DynamicHeightContainer(
          surahIndex: surahIndex,
        ),
      ),
    );
  }
}