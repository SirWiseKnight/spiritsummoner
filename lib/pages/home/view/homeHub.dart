import 'package:flutter/material.dart';
import 'package:spirit_summoner/pages/home/shared/homeBarrel.dart';
import 'package:spirit_summoner/config/barrel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 219, 208, 189),
              Color.fromARGB(255, 219, 208, 189),
              Color.fromARGB(255, 73, 62, 43),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            AppBarPane(),
            SafeArea(
              top: false,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.615,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.315,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.115,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: PartnerImageWIP(),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.125,
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.125,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  PartnerNameWIP(),
                                  PartnerHPWIP(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                ),
                                PartnerStatsWIP(),
                              ],
                            ),
                            Expanded(child: Container()),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
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
          ],
        ),
      ),
    );
  }
}
