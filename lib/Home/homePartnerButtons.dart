import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PartnerActionButtons extends StatelessWidget {
  const PartnerActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              top: 8.0,
              bottom: 17.0,
            ),
            child: Container(
              height: 65,
              width: 180,
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
                        color: Colors.white,
                        size: 40,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Container(
                          width: 85,
                          alignment: Alignment.center,
                          child: Text(
                            'Attacks',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 17.0,
            ),
            child: Container(
              height: 65,
              width: 180,
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
                        size: 40,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Container(
                          width: 85,
                          alignment: Alignment.center,
                          child: Text(
                            'Gear',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: Container(
              height: 65,
              width: 180,
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
                        size: 40,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Container(
                          width: 85,
                          alignment: Alignment.center,
                          child: Text(
                            'Talent',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
