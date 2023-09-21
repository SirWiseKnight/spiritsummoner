import 'package:flutter/material.dart';
import 'package:spirit_summoner/pages/battle/widgets/spiritList.dart';
import 'package:spirit_summoner/config/barrel.dart';

class SpiritListScreen extends StatelessWidget {
  const SpiritListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 124, 203, 89),
              Color.fromARGB(255, 171, 222, 149),
              Color.fromARGB(255, 104, 195, 66),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            AppBarPane(),
            SpiritList(),
            BottomNavBubbles(),
          ],
        ),
      ),
    );
  }
}
