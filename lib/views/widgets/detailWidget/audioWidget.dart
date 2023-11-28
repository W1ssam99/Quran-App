import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/quran.dart';
import 'package:untitled5/componets/icons.dart';

import '../../../componets/colors.dart';

class MyAudioPlayer extends StatefulWidget {
  final int surahIndex;

  MyAudioPlayer({Key? key, required this.surahIndex}) : super(key: key);

  @override
  _MyAudioPlayerState createState() => _MyAudioPlayerState();
}

class _MyAudioPlayerState extends State<MyAudioPlayer> {
  late AudioPlayer audioPlayer;
  bool isPlaying = false;
  bool isSaved = false;


  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playAudio() async {
    if (isPlaying) {
      await audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      try {
        await audioPlayer.play(
          UrlSource(
           "https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/001.mp3"
          ),
        );

        setState(() {
          isPlaying = !isPlaying;
        });
        print('Playing audio');
        print(getAudioURLBySurah(widget.surahIndex));
      } catch (e) {
        print('Error playing audio: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 370,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: SvgPicture.asset(
                      saveIco,
                      color: isSaved ? mainColor : secondaryColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  getSurahName(widget.surahIndex),
                  style: TextStyle(
                    fontSize: 20,
                    color: secondaryColor,
                  ),
                ),
              ),
            ],
          ),
          Slider(
            value: 0.5,
            onChanged: (value) {},
            activeColor: secondaryColor,
            inactiveColor: secondaryColor.withOpacity(0.5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.skip_previous,
                  color: secondaryColor,
                ),
              ),
              IconButton(
                onPressed: () async {
                  if (isPlaying) {
                    await audioPlayer.pause();
                    setState(() {
                      isPlaying = false;
                    });
                  } else {
                    try {
                      await audioPlayer.play(
                         UrlSource(
                            getAudioURLBySurah(widget.surahIndex)
                        ),
                      );
                      setState(() {
                        isPlaying = true;
                      });
                      print('Playing audio');
                      print(getAudioURLBySurah(widget.surahIndex));
                    } catch (e) {
                      print('Error playing audio: $e');
                    }
                  }
                },
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  color: secondaryColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.skip_next,
                  color: secondaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}