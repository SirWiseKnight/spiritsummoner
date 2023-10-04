import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class SpiritCard extends StatelessWidget {
  const SpiritCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          border: GradientBoxBorder(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white.withOpacity(0.4),
                Colors.white.withOpacity(0.01),
                Colors.white.withOpacity(0.1),
              ],
            ),
            width: 1.4,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/Backgrounds/bgWater.png'),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 175,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Container(
                          height: double.infinity,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              alignment: Alignment.centerRight,
                              fit: BoxFit.fitHeight,
                              image:
                                  AssetImage('assets/Spirits/1_tottoc_x2.png'),
                            )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 12.0,
                          top: 8.0,
                          bottom: 8.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tottoc',
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Lvl ' + '1',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.height * 0.03,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.fill,
                                image: AssetImage('assets/Icons/typeWater.png'),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.23),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.0375,
                            height: double.infinity,
                            child: RotatedBox(
                              quarterTurns: -1,
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.0375,
                                child: Container(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: LinearProgressIndicator(
                                      value: 0.5,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.red,
                                      ),
                                      backgroundColor:
                                          Colors.white.withOpacity(0.23),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.0375,
                            height: double.infinity,
                            child: RotatedBox(
                              quarterTurns: -1,
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.0375,
                                child: Container(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: LinearProgressIndicator(
                                      value: 0.5,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.blue,
                                      ),
                                      backgroundColor:
                                          Colors.white.withOpacity(0.23),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.0375,
                            height: double.infinity,
                            child: RotatedBox(
                              quarterTurns: -1,
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.0375,
                                child: Container(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: LinearProgressIndicator(
                                      value: 0.5,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.purple,
                                      ),
                                      backgroundColor:
                                          Colors.white.withOpacity(0.23),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.0375,
                            height: double.infinity,
                            child: RotatedBox(
                              quarterTurns: -1,
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.0375,
                                child: Container(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: LinearProgressIndicator(
                                      value: 0.5,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.green,
                                      ),
                                      backgroundColor:
                                          Colors.white.withOpacity(0.23),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.0375,
                            height: double.infinity,
                            child: RotatedBox(
                              quarterTurns: -1,
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.0375,
                                child: Container(
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: LinearProgressIndicator(
                                      value: 0.5,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.orange,
                                      ),
                                      backgroundColor:
                                          Colors.white.withOpacity(0.23),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
