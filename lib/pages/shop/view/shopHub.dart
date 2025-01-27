import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit_summoner/pages/shop/shared/shopBarrel.dart';
import 'package:spirit_summoner/config/barrel.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

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
                    height: MediaQuery.of(context).size.height * 0.615,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16.0,
                            left: 16.0,
                            right: 16.0,
                          ),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Bonus Items',
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
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 16.0,
                            left: 16.0,
                            top: 24.0,
                          ),
                          child: Container(
                            width: double.infinity,
                            child: ElevatedButton(
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
                                      Radius.circular(16.0),
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                print("You received a daily bonus!");
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Login Bonus',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            top: 16.0,
                          ),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Shops',
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
                        ShopList(),
                        Expanded(
                          child: Container(),
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
