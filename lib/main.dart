import 'package:flutter/material.dart';
import 'package:untitled5/views/screens/navBar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MyNavigationBar(),
    );
  }
}
