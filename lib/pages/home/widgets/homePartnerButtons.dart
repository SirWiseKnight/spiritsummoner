import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PartnerActionButtons extends StatelessWidget {
  const PartnerActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.4,
              child: ElevatedButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(
                      Colors.redAccent.shade100),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                ),
                onPressed: () {
                  print("You pressed the Attacks Button!");
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.meteor,
                        size: MediaQuery.of(context).size.height * 0.035,
                        color: Colors.white,
                        shadows: <Shadow>[
                          Shadow(
                            color: Colors.black.withOpacity(0.7),
                            blurRadius: 1.0,
                            offset: Offset(
                              1,
                              1,
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.225,
                        alignment: Alignment.center,
                        child: Text(
                          'Attacks',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                color: Colors.black.withOpacity(0.7),
                                blurRadius: 1.0,
                                offset: Offset(
                                  1,
                                  1,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.4,
              child: ElevatedButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(
                      Colors.orangeAccent.shade100),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orangeAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                ),
                onPressed: () {
                  print("You pressed the Gear Button!");
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.crown,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.height * 0.035,
                        shadows: <Shadow>[
                          Shadow(
                            color: Colors.black.withOpacity(0.7),
                            blurRadius: 1.0,
                            offset: Offset(
                              1,
                              1,
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.225,
                        alignment: Alignment.center,
                        child: Text(
                          'Gear',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                color: Colors.black.withOpacity(0.7),
                                blurRadius: 1.0,
                                offset: Offset(
                                  1,
                                  1,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.4,
              child: ElevatedButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(
                      Colors.blueAccent.shade100),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                  ),
                ),
                onPressed: () {
                  print("You pressed the Talent Button!");
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.dna,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.height * 0.035,
                        shadows: <Shadow>[
                          Shadow(
                            color: Colors.black.withOpacity(0.7),
                            blurRadius: 1.0,
                            offset: Offset(
                              1,
                              1,
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.225,
                        alignment: Alignment.center,
                        child: Text(
                          'Talent',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                color: Colors.black.withOpacity(0.7),
                                blurRadius: 1.0,
                                offset: Offset(
                                  1,
                                  1,
                                ),
                              )
                            ],
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
      ),
    );
  }
}
