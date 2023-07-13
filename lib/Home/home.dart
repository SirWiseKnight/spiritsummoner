import 'package:flutter/material.dart';
import 'package:spirit_summoner/Home/homeBarrel.dart';
import 'package:spirit_summoner/Home/homePartnerHP%20copy.dart';
import 'package:spirit_summoner/Home/homePartnerName%20copy.dart';
import 'package:spirit_summoner/Shared/barrel.dart';
import 'package:spirit_summoner/Shared/bottomNavNew.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Backgrounds/bgWater.png'),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            children: [
              AppBarPane(),
              Container(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.315,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Image.asset(
                            'assets/Platforms/platformWater.webp',
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.115,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: PartnerImageWIP(),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.125,
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.125,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              PartnerNameWIP(),
                              PartnerHPWIP(),
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.125,
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.4,
                            ),
                            PartnerStatsWIP(),
                          ],
                        ),
                        Expanded(child: Container()),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.4,
                            ),
                            PartnerActionButtons(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BottomNavBubbles(),
            ],
          ),
        ),
      ),
    );
  }
}
