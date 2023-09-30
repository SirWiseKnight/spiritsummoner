import 'package:flutter/material.dart';
import 'package:spirit_summoner/pages/battle/view/spiritListPage.dart';
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
              Color.fromARGB(255, 124, 203, 89),
              Color.fromARGB(255, 171, 222, 149),
              Color.fromARGB(255, 104, 195, 66),
            ],
            begin: Alignment.topCenter,
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
                    height: MediaQuery.of(context).size.height * 0.66,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.33,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              width: MediaQuery.of(context).size.width * 0.95,
                              child: Image.asset(
                                'assets/Platforms/platformWind.webp',
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                              ),
                              GestureDetector(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: PartnerImageWIP(),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SpiritListScreen()),
                                  );
                                },
                                onLongPress: () {
                                  print(
                                      'Invoke a way to change partner spirit.');
                                },
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          color: Colors.blue,
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                  ),
                                  PartnerName(),
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
                                  height: MediaQuery.of(context).size.height *
                                      0.415,
                                ),
                                PartnerHP(),
                                PartnerStatsWIP(),
                              ],
                            ),
                            Expanded(child: Container()),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.41,
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
