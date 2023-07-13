import 'package:flutter/material.dart';
import 'package:spirit_summoner/config/barrel.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(child: Container()),
          BottomNavBubbles(),
        ],
      ),
    ));
  }
}
