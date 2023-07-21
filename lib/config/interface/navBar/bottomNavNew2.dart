import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spirit_summoner/pages/battle/view/battleHub.dart';
import 'package:spirit_summoner/pages/chat/view/chatHub.dart';
import 'package:spirit_summoner/pages/home/view/homeHub.dart';
import 'package:spirit_summoner/pages/quest/view/questHub.dart';
import 'package:spirit_summoner/pages/shop/view/shopHub.dart';

class BottomNavBubbles2 extends StatefulWidget {
  const BottomNavBubbles2({Key? key}) : super(key: key);

  @override
  State<BottomNavBubbles2> createState() => new _BottomNavBubbles2State();
}

class _BottomNavBubbles2State extends State<BottomNavBubbles2> {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.175,
              width: MediaQuery.of(context).size.width * 0.175,
              decoration: BoxDecoration(
                color: Colors.blue,
                border: GradientBoxBorder(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.white.withOpacity(0.4),
                      Colors.white.withOpacity(0.01),
                      Colors.white.withOpacity(0.1),
                    ],
                  ),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _pageIndex = 0;
                    print(_pageIndex);
                  });
                },
                icon: Icon(
                  FontAwesomeIcons.house,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.175,
              width: MediaQuery.of(context).size.width * 0.175,
              decoration: BoxDecoration(
                color: Colors.red,
                border: GradientBoxBorder(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.white.withOpacity(0.4),
                      Colors.white.withOpacity(0.01),
                      Colors.white.withOpacity(0.1),
                    ],
                  ),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _pageIndex = 1;
                    print(_pageIndex);
                  });
                },
                icon: Icon(
                  FontAwesomeIcons.dungeon,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.175,
              width: MediaQuery.of(context).size.width * 0.175,
              decoration: BoxDecoration(
                color: Colors.green,
                border: GradientBoxBorder(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.white.withOpacity(0.4),
                      Colors.white.withOpacity(0.01),
                      Colors.white.withOpacity(0.1),
                    ],
                  ),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _pageIndex = 2;
                    print(_pageIndex);
                  });
                },
                icon: Icon(
                  FontAwesomeIcons.shield,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.175,
              width: MediaQuery.of(context).size.width * 0.175,
              decoration: BoxDecoration(
                color: Colors.amber,
                border: GradientBoxBorder(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.white.withOpacity(0.4),
                      Colors.white.withOpacity(0.01),
                      Colors.white.withOpacity(0.1),
                    ],
                  ),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _pageIndex = 3;
                    print(_pageIndex);
                  });
                },
                icon: Icon(
                  FontAwesomeIcons.piggyBank,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.175,
              width: MediaQuery.of(context).size.width * 0.175,
              decoration: BoxDecoration(
                color: Colors.purple,
                border: GradientBoxBorder(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.white.withOpacity(0.4),
                      Colors.white.withOpacity(0.01),
                      Colors.white.withOpacity(0.1),
                    ],
                  ),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _pageIndex = 4;
                    print(_pageIndex);
                  });
                },
                icon: Icon(
                  FontAwesomeIcons.envelopeOpenText,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
