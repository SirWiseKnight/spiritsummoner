import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:spirit_summoner/pages/quest/shared/questBarrel.dart';
import 'package:spirit_summoner/pages/quest/shared/questPages.dart';
import 'package:spirit_summoner/config/barrel.dart';

class QuestTaskScreen extends StatelessWidget {
  const QuestTaskScreen({Key? key}) : super(key: key);

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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 12.0,
                            top: 8.0,
                            right: 12.0,
                          ),
                          child: Row(
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
                                          const Color.fromARGB(
                                              150, 131, 40, 40),
                                          const Color.fromARGB(
                                              150, 131, 40, 40),
                                        ],
                                      ),
                                      width: MediaQuery.of(context).size.width *
                                          0.0035,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    'X',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.bungee(
                                      fontSize: 32,
                                      color: const Color.fromARGB(
                                          255, 237, 40, 40),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Quest Logs',
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
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.075,
                                width:
                                    MediaQuery.of(context).size.height * 0.075,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                            bottom: 8.0,
                          ),
                          child: SubAreaList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 2.0,
                            bottom: 2.0,
                            left: 12.0,
                            right: 12.0,
                          ),
                          child: Container(
                            height: 2,
                            width: double.infinity,
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 8.0,
                            left: 8.0,
                          ),
                          child: QuestList(),
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
