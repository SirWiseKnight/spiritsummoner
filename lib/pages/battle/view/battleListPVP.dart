import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit_summoner/pages/battle/view/spiritListPage.dart';
import 'package:spirit_summoner/pages/battle/widgets/spiritSquad1.dart';
import 'package:spirit_summoner/pages/battle/widgets/spiritSquad2.dart';
import 'package:spirit_summoner/pages/battle/widgets/spiritSquad3.dart';
import 'package:spirit_summoner/pages/battle/widgets/summonerList.dart';
import 'package:spirit_summoner/config/barrel.dart';

class BattlePVPScreen extends StatelessWidget {
  const BattlePVPScreen({Key? key}) : super(key: key);

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
                    height: MediaQuery.of(context).size.height * 0.635,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16.0,
                            left: 16.0,
                            right: 16.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Battle Hub',
                                  style: GoogleFonts.bungee(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        // bottomLeft
                                        offset: Offset(-1, -1),
                                        color: Colors.black,
                                      ),
                                      Shadow(
                                        // bottomRight
                                        offset: Offset(1, -1),
                                        color: Colors.black,
                                      ),
                                      Shadow(
                                        // topRight
                                        offset: Offset(1, 1),
                                        color: Colors.black,
                                      ),
                                      Shadow(
                                        // topLeft
                                        offset: Offset(-1, 1),
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color.fromARGB(255, 50, 215, 75)
                                        .withOpacity(0.75),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(100.0),
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SpiritListScreen()),
                                  );
                                },
                                child: Text(
                                  'Spirits',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SpiritSquad1(),
                              SpiritSquad2(),
                              SpiritSquad3(),
                            ],
                          ),
                        ),
                        SummonerList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BottomNavBubbles(),
          ],
        ),
      ),
    );
  }
}
