import 'package:flutter/material.dart';
import 'package:spirit_summoner/Home/homeBarrel.dart';
import 'package:spirit_summoner/Home/homePartnerHP%20copy.dart';
import 'package:spirit_summoner/Home/homePartnerName%20copy.dart';
import 'package:spirit_summoner/Shared/barrel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarPane(),
            Stack(
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
                Center(
                  child: Container(
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
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                        ),
                        PartnerStatsWIP(),
                      ],
                    ),
                    Expanded(child: Container()),
                    Column(
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
