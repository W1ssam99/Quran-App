import 'package:flutter/material.dart';

import '../widgets/homeScreenWidget.dart';

class SurahListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SurahCard(),
      ],
    );
  }
}

class ParaListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Para View'),
        ),
      ],
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