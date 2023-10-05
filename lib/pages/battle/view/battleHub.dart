import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit_summoner/pages/battle/view/spiritListPage.dart';
import 'package:spirit_summoner/pages/battle/widgets/spiritSquad1.dart';
import 'package:spirit_summoner/pages/battle/widgets/spiritSquad2.dart';
import 'package:spirit_summoner/pages/battle/widgets/spiritSquad3.dart';
import 'package:spirit_summoner/pages/battle/widgets/summonerList.dart';
import 'package:spirit_summoner/config/barrel.dart';

class BattleScreen extends StatelessWidget {
  const BattleScreen({Key? key}) : super(key: key);

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
                    height: MediaQuery.of(context).size.height * 0.65,
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
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 239, 100, 254),
                                  Color.fromARGB(255, 217, 40, 237),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 12.0,
                                  right: 12.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'BP: ' + '10' + '/' + '10',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
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
                                    Text(
                                      '01:30',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
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
                                    Text(
                                      'Refresh Button',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 12.0,
                            right: 12.0,
                            top: 8.0,
                            bottom: 8.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 80,
                                width: 190,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SpiritListScreen()),
                                    );
                                  },
                                  child: Text(
                                    'Rankings',
                                    style: GoogleFonts.bungee(
                                      fontSize: 16,
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
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Color.fromARGB(255, 215, 50, 50),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 80,
                                width: 190,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SpiritListScreen()),
                                    );
                                  },
                                  child: Text(
                                    'World Boss',
                                    style: GoogleFonts.bungee(
                                      fontSize: 16,
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
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Color.fromARGB(255, 50, 215, 75),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 12.0,
                            right: 12.0,
                            top: 12.0,
                          ),
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SpiritListScreen()),
                                );
                              },
                              child: Text(
                                'Battle',
                                style: GoogleFonts.bungee(
                                  fontSize: 24,
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
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 50, 108, 215),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(16.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
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
