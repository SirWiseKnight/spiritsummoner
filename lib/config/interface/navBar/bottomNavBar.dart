import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spirit_summoner/pages/battle/view/battleHub.dart';
import 'package:spirit_summoner/pages/chat/view/chatHub.dart';
import 'package:spirit_summoner/pages/home/view/homeHub.dart';
import 'package:spirit_summoner/pages/quest/view/questHub.dart';
import 'package:spirit_summoner/pages/shop/view/shopHub.dart';

var currentIndexOption = 0;
const begin = Offset(0.0, 1.0);
const end = Offset.zero;
const curve = Curves.ease;
var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color.fromARGB(255, 7, 35, 67),
      unselectedItemColor: Colors.white,
      showUnselectedLabels: true,
      iconSize: 30,
      currentIndex: currentIndexOption,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.archway,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.dungeon,
          ),
          label: 'Quest',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.toriiGate,
          ),
          label: 'Battle',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.landmarkDome,
          ),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.envelopeOpenText,
          ),
          label: 'Chat',
        ),
      ],
      onTap: (int idx) {
        switch (idx) {
          case 0:
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => HomeScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );
            currentIndexOption = 0;
            break;
          case 1:
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => QuestScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );
            currentIndexOption = 1;
            break;
          case 2:
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => BattleScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );
            currentIndexOption = 2;
            break;
          case 3:
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => ShopScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );
            currentIndexOption = 3;
            break;
          case 4:
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => ChatScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );
            currentIndexOption = 4;
            break;
        }
      },
    );
  }
}
