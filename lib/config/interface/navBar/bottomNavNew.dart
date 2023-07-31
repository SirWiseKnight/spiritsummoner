import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spirit_summoner/pages/battle/view/battleHub.dart';
import 'package:spirit_summoner/pages/chat/view/chatHub.dart';
import 'package:spirit_summoner/pages/home/view/homeHub.dart';
import 'package:spirit_summoner/pages/quest/view/questHub.dart';
import 'package:spirit_summoner/pages/shop/view/shopHub.dart';

class BottomNavBubbles extends StatelessWidget {
  const BottomNavBubbles({Key? key}) : super(key: key);

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuestScreen()),
                  );
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BattleScreen()),
                  );
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ShopScreen()),
                  );
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatScreen()),
                  );
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
