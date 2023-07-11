import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PartnerStats extends StatelessWidget {
  const PartnerStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 8.0,
        right: 8.0,
        bottom: 4.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.8),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        width: 180,
        height: 190,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 40,
                      child: Text(
                        "ATK",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 15,
                      width: 115,
                      child: LinearProgressIndicator(
                        value: 0.5,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.red,
                        ),
                        backgroundColor: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 40,
                      child: Text(
                        "DEF",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 15,
                      width: 115,
                      child: LinearProgressIndicator(
                        value: 0.5,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.blue,
                        ),
                        backgroundColor: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 40,
                      child: Text(
                        "MGK",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 15,
                      width: 115,
                      child: LinearProgressIndicator(
                        value: 0.5,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.purple,
                        ),
                        backgroundColor: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 40,
                      child: Text(
                        "MDF",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 15,
                      width: 115,
                      child: LinearProgressIndicator(
                        value: 0.5,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.green,
                        ),
                        backgroundColor: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 40,
                      child: Text(
                        "SPD",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 15,
                      width: 115,
                      child: LinearProgressIndicator(
                        value: 0.5,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.yellow,
                        ),
                        backgroundColor: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 40,
                      child: Text(
                        "LCK",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 15,
                      width: 115,
                      child: LinearProgressIndicator(
                        value: 0.5,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.orange,
                        ),
                        backgroundColor: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
