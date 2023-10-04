import 'package:flutter/material.dart';
import 'package:spirit_summoner/pages/battle/widgets/spiritList.dart';
import 'package:spirit_summoner/config/barrel.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit_summoner/pages/battle/widgets/spiritSquad1.dart';
import 'package:spirit_summoner/pages/battle/widgets/spiritSquad2.dart';
import 'package:spirit_summoner/pages/battle/widgets/spiritSquad3.dart';

class SpiritListScreen extends StatelessWidget {
  const SpiritListScreen({Key? key}) : super(key: key);

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
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                top: 16.0,
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Squadron',
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
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: GestureDetector(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color.fromARGB(255, 237, 40, 40),
                                  const Color.fromARGB(255, 237, 40, 40),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              border: GradientBoxBorder(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    const Color.fromARGB(150, 131, 40, 40),
                                    const Color.fromARGB(150, 131, 40, 40),
                                  ],
                                ),
                                width:
                                    MediaQuery.of(context).size.width * 0.0035,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            alignment: Alignment.center,
                            height: 40,
                            width: 112,
                            child: Text(
                              'Saved',
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    // bottomLeft
                                    offset: Offset(-1, -1),
                                    color:
                                        const Color.fromARGB(255, 77, 21, 21),
                                  ),
                                  Shadow(
                                    // bottomRight
                                    offset: Offset(1, -1),
                                    color:
                                        const Color.fromARGB(255, 77, 21, 21),
                                  ),
                                  Shadow(
                                    // topRight
                                    offset: Offset(1, 1),
                                    color:
                                        const Color.fromARGB(255, 77, 21, 21),
                                  ),
                                  Shadow(
                                    // topLeft
                                    offset: Offset(-1, 1),
                                    color:
                                        const Color.fromARGB(255, 77, 21, 21),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(120, 255, 255, 255),
                                  Color.fromARGB(70, 255, 255, 255),
                                  Color.fromARGB(15, 255, 255, 255),
                                  Color.fromARGB(15, 255, 255, 255),
                                  Color.fromARGB(1, 255, 255, 255),
                                  Color.fromARGB(5, 0, 0, 0),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomCenter,
                              ),
                              border: GradientBoxBorder(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    const Color.fromARGB(150, 131, 40, 40),
                                    const Color.fromARGB(150, 131, 40, 40),
                                  ],
                                ),
                                width:
                                    MediaQuery.of(context).size.width * 0.0035,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            height: 40,
                            width: 112,
                          ),
                        ],
                      ),
                      onTap: () {
                        print('You pressed the Saved Button!');
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: SpiritSquad1(),
                ),
                Container(
                  child: SpiritSquad2(),
                ),
                Container(
                  child: SpiritSquad3(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12.0,
                    top: 16.0,
                  ),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Spirit List',
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
                  ),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, right: 12.0),
                  child: GestureDetector(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color.fromARGB(255, 237, 40, 40),
                                const Color.fromARGB(255, 237, 40, 40),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            border: GradientBoxBorder(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomLeft,
                                colors: [
                                  const Color.fromARGB(150, 131, 40, 40),
                                  const Color.fromARGB(150, 131, 40, 40),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width * 0.0035,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: Alignment.center,
                          height: 40,
                          width: 112,
                          child: Text(
                            'Index',
                            style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  // bottomLeft
                                  offset: Offset(-1, -1),
                                  color: const Color.fromARGB(255, 77, 21, 21),
                                ),
                                Shadow(
                                  // bottomRight
                                  offset: Offset(1, -1),
                                  color: const Color.fromARGB(255, 77, 21, 21),
                                ),
                                Shadow(
                                  // topRight
                                  offset: Offset(1, 1),
                                  color: const Color.fromARGB(255, 77, 21, 21),
                                ),
                                Shadow(
                                  // topLeft
                                  offset: Offset(-1, 1),
                                  color: const Color.fromARGB(255, 77, 21, 21),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(120, 255, 255, 255),
                                Color.fromARGB(70, 255, 255, 255),
                                Color.fromARGB(15, 255, 255, 255),
                                Color.fromARGB(15, 255, 255, 255),
                                Color.fromARGB(1, 255, 255, 255),
                                Color.fromARGB(5, 0, 0, 0),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomCenter,
                            ),
                            border: GradientBoxBorder(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomLeft,
                                colors: [
                                  const Color.fromARGB(150, 131, 40, 40),
                                  const Color.fromARGB(150, 131, 40, 40),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width * 0.0035,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          height: 40,
                          width: 112,
                        ),
                      ],
                    ),
                    onTap: () {
                      print('You pressed the Index Button!');
                    },
                  ),
                ),
              ],
            ),
            SpiritList(),
            BottomNavBubbles(),
          ],
        ),
      ),
    );
  }
}
