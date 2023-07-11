import 'package:flutter/material.dart';
import 'package:spirit_summoner/Home/homeBarrel.dart';
import 'package:spirit_summoner/Home/homePartnerHP%20copy.dart';
import 'package:spirit_summoner/Home/homePartnerName%20copy.dart';
import 'package:spirit_summoner/Home/homePartnerStats%20copy.dart';
import 'package:spirit_summoner/Shared/barrel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              AppBarPane(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SafeArea(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 230.0),
                        child: Container(
                          height: 200,
                          width: 500,
                          child: Image.asset(
                            'assets/Platforms/platformWater.webp',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 60.0,
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
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              bottom: 8.0,
                              left: 8.0,
                              right: 8.0,
                            ),
                            child: PartnerNameWIP(),
                          ),
                          PartnerHPWIP(),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 335,
                              ),
                              Container(
                                height: 250,
                                child: PartnerStatsWIP(),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          Column(
                            children: [
                              SizedBox(
                                height: 335,
                              ),
                              PartnerActionButtons(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
