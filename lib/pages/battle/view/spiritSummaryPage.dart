import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:spirit_summoner/pages/battle/widgets/spiritGear.dart';
import 'package:spirit_summoner/pages/battle/widgets/spiritMoves.dart';
import 'package:spirit_summoner/pages/battle/widgets/spiritStats.dart';
import 'package:spirit_summoner/pages/battle/widgets/spiritTalent.dart';
import 'package:spirit_summoner/pages/home/shared/homeBarrel.dart';

class SpiritSummaryScreen extends StatelessWidget {
  const SpiritSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 141, 224, 240),
                  Color.fromARGB(255, 141, 224, 240),
                  Color.fromARGB(255, 149, 226, 240),
                  Color.fromARGB(255, 196, 233, 240),
                  Color.fromARGB(255, 156, 227, 241),
                  Color.fromARGB(255, 133, 221, 238),
                  Color.fromARGB(255, 141, 224, 240),
                  Color.fromARGB(255, 141, 224, 240),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 425.0),
            child: Container(
              height: 200,
              width: 400,
              child: Center(child: PartnerPlatformWIP()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 50.0,
            ),
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.4,
                child: PartnerImageWIP(),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 24.0,
                  top: 24.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        height: 56,
                        width: 64,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white,
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
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'X',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 32,
                            color: const Color.fromARGB(255, 237, 40, 40),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    GestureDetector(
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
                              'More',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
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
                        print('You pressed the More Button!');
                      },
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 100, 216, 85),
                                Color.fromARGB(255, 100, 216, 85),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            border: GradientBoxBorder(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomLeft,
                                colors: [
                                  const Color.fromARGB(200, 58, 126, 72),
                                  const Color.fromARGB(200, 58, 126, 72),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width * 0.0035,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Transform',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              shadows: [
                                Shadow(
                                  // bottomLeft
                                  offset: Offset(-1, -1),
                                  color: const Color.fromARGB(200, 31, 74, 40),
                                ),
                                Shadow(
                                  // bottomRight
                                  offset: Offset(1, -1),
                                  color: const Color.fromARGB(200, 31, 74, 40),
                                ),
                                Shadow(
                                  // topRight
                                  offset: Offset(1, 1),
                                  color: const Color.fromARGB(200, 31, 74, 40),
                                ),
                                Shadow(
                                  // topLeft
                                  offset: Offset(-1, 1),
                                  color: const Color.fromARGB(200, 31, 74, 40),
                                ),
                              ],
                            ),
                          ),
                          height: 50,
                          width: 150,
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
                                  const Color.fromARGB(200, 58, 126, 72),
                                  const Color.fromARGB(200, 58, 126, 72),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width * 0.0035,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 50,
                          width: 150,
                        ),
                      ],
                    ),
                    onTap: () {
                      print("You pressed the Transform Button!");
                    },
                  ),
                  GestureDetector(
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 100, 216, 85),
                                Color.fromARGB(255, 100, 216, 85),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            border: GradientBoxBorder(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomLeft,
                                colors: [
                                  const Color.fromARGB(200, 58, 126, 72),
                                  const Color.fromARGB(200, 58, 126, 72),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width * 0.0035,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Level Up',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              shadows: [
                                Shadow(
                                  // bottomLeft
                                  offset: Offset(-1, -1),
                                  color: const Color.fromARGB(200, 31, 74, 40),
                                ),
                                Shadow(
                                  // bottomRight
                                  offset: Offset(1, -1),
                                  color: const Color.fromARGB(200, 31, 74, 40),
                                ),
                                Shadow(
                                  // topRight
                                  offset: Offset(1, 1),
                                  color: const Color.fromARGB(200, 31, 74, 40),
                                ),
                                Shadow(
                                  // topLeft
                                  offset: Offset(-1, 1),
                                  color: const Color.fromARGB(200, 31, 74, 40),
                                ),
                              ],
                            ),
                          ),
                          height: 50,
                          width: 150,
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
                                  const Color.fromARGB(200, 58, 126, 72),
                                  const Color.fromARGB(200, 58, 126, 72),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width * 0.0035,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 50,
                          width: 150,
                        ),
                      ],
                    ),
                    onTap: () {
                      print("You pressed the Level Up Button!");
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: PartnerNameWIP(),
              ),
              PartnerHPWIP(),
              Container(height: 300),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpiritTalent(),
                  SpiritGear(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpiritStats(),
                  SpiritMoves(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
