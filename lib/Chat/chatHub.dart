import 'package:flutter/material.dart';
import 'package:spirit_summoner/Home/homeBarrel.dart';
import 'package:spirit_summoner/Home/homePartnerHP%20copy.dart';
import 'package:spirit_summoner/Home/homePartnerName%20copy.dart';
import 'package:spirit_summoner/Shared/barrel.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.205,
                width: MediaQuery.of(context).size.width * 0.95,
                child: AppBarPane(),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.795,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PartnerNameWIP(),
                  PartnerHPWIP(),
                  PartnerImageWIP(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PartnerStatsWIP(),
                      PartnerActionButtons(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
