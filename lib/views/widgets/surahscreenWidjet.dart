import 'package:flutter/material.dart';
import 'package:quran/quran.dart';
import 'package:untitled5/componets/images.dart';
import 'package:velocity_x/velocity_x.dart';

class DynamicHeightContainer extends StatelessWidget {
  final int surahIndex;

  DynamicHeightContainer({required this.surahIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(decoreation),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20,
              top: 20,
            bottom: 25,),
            child: ListView.builder(
              itemCount: getVerseCount(surahIndex),
              itemBuilder: (BuildContext context, int index) => Container(
                padding: EdgeInsets.all(5),
                child: Wrap(
                  children: [
                    Text(
                           getVerse(surahIndex, index+1),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
                ),
              ),
          ),
          ),
      ],
    );
  }
}
