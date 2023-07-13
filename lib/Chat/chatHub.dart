import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spirit_summoner/Battle/battleHub.dart';
import 'package:spirit_summoner/Home/home.dart';
import 'package:spirit_summoner/Quest/questHub.dart';
import 'package:spirit_summoner/Shared/bottomNavNew.dart';
import 'package:spirit_summoner/Shop/shopHub.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(child: Container()),
        BottomNavBubbles(),
      ],
    ));
  }
}
