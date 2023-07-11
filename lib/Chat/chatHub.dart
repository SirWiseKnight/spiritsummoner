import 'package:flutter/material.dart';
import 'package:spirit_summoner/Home/homePartnerBackground.dart';
import 'package:spirit_summoner/Home/homePartnerButtons%20copy.dart';
import 'package:spirit_summoner/Home/homePartnerPlatform.dart';
import 'package:spirit_summoner/Shared/bottomNavBar.dart';
import 'package:spirit_summoner/Home/homePartnerHP copy.dart';
import 'package:spirit_summoner/Home/homePartnerImage.dart';
import 'package:spirit_summoner/Home/homePartnerStats copy.dart';
import 'package:spirit_summoner/Home/homePartnerName copy.dart';
import 'package:spirit_summoner/Home/homePartnerMoves.dart';
import 'package:spirit_summoner/Home/homePartnerGear.dart';
import 'package:spirit_summoner/Home/homePartnerTalent.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: PartnerBackgroundWIP(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 330.0),
                child: Container(
                  height: 200,
                  width: 400,
                  child: Center(child: PartnerPlatformWIP()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 120.0,
                  left: 60.0,
                ),
                child: Center(
                  child: Container(
                    height: 350,
                    width: 350,
                    child: PartnerImageWIP(),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: PartnerNameWIP(),
                  ),
                  PartnerHPWIP(),
                  SpiritActionButtons(),
                  Container(height: 280),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PartnerTalentWIP(),
                      PartnerGearWIP(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PartnerStatsWIP(),
                      PartnerMovesWIP(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
