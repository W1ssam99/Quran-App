import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';
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
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isPlaying = false;
  bool isSaved = false;


  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    loadAudio();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> loadAudio() async {
    final surahAudioUrl = getAudioURLBySurah(widget.surahIndex);
    await audioPlayer.setUrl(surahAudioUrl);

    audioPlayer.durationStream.listen((event) {
      setState(() {
        duration = event!;
      });
    });

    audioPlayer.positionStream.listen((event) {
      setState(() {
        position = event;
      });
    });

    audioPlayer.playerStateStream.listen((event) {
      setState(() {
        isPlaying = event.playing;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width:double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isSaved = !isSaved;
                    });
                  },
                 icon : SvgPicture.asset(
                    saveIco,
                    color: isSaved ? mainColor : secondaryColor,
                  ),
                ),
                Text(
                  getSurahName(widget.surahIndex),
                  style: TextStyle(
                    fontSize: 20,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Slider(
              value: position.inSeconds.toDouble(),
              onChanged: (value) {
                final newPosition = Duration(seconds: value.toInt());
                audioPlayer.seek(newPosition);
              },
              min: 0,
              max: duration.inSeconds.toDouble(),
              activeColor: secondaryColor,
              inactiveColor: secondaryColor.withOpacity(0.5),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    audioPlayer.seek(Duration.zero); // Seek to the start of the audio
                  },
                  icon: Icon(
                    Icons.skip_previous,
                    color: secondaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (isPlaying) {
                      audioPlayer.pause();
                    } else {
                      audioPlayer.play();
                      AudioServiceBackground.setState(
                        controls: [MediaControl.pause],
                        playing: true,

                      );
                    }
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: secondaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    audioPlayer.seek(duration); // Seek to the end of the audio
                  },
                  icon: Icon(
                    Icons.skip_next,
                    color: secondaryColor,
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