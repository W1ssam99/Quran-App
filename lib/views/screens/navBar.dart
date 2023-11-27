import 'package:flutter/material.dart';
import 'package:untitled5/views/screens/Home.dart';
import 'package:untitled5/views/screens/savedScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../componets/colors.dart';
import '../../componets/icons.dart';
import 'adanScreen.dart';
import 'duaaScreen.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBar();
}

class _MyNavigationBar extends State<MyNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> _screens = [
      const HomeScreen(),
      const AdanScreen(),
      const DuaaScreen(),
      const SavedScreen(),
    ];
    return Scaffold(

      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(homeIco,color: _currentIndex==0? mainColor :secondaryColor,), label: "Home"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(adanIco,color: _currentIndex==1? mainColor :secondaryColor), label: "Adan"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(duaaIco,color: _currentIndex==2? mainColor :secondaryColor), label: "Duaa"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(saveIco,color: _currentIndex==3? mainColor :secondaryColor), label: "Saved"),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
