import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit_summoner/pages/profiles/view/playerProfile.dart';

class PlayerIcon extends StatelessWidget {
  const PlayerIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()),
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.085,
          width: MediaQuery.of(context).size.height * 0.085,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 0.6,
              colors: [
                Color.fromARGB(255, 209, 234, 251),
                Color.fromARGB(255, 102, 171, 231),
              ],
            ),
            border: GradientBoxBorder(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 174, 221, 116),
                  Color.fromARGB(255, 160, 202, 95),
                ],
              ),
              width: 6,
            ),
            borderRadius: BorderRadius.circular(100),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 1.0,
                offset: Offset(
                  0,
                  2,
                ),
              )
            ],
          ),
          child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.height * 0.09,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'LEVEL',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-1, -1),
                              color: Color.fromARGB(255, 200, 87, 12)),
                          Shadow(
                              // bottomRight
                              offset: Offset(1, -1),
                              color: Color.fromARGB(255, 200, 87, 12)),
                          Shadow(
                              // topRight
                              offset: Offset(1, 1),
                              color: Color.fromARGB(255, 200, 87, 12)),
                          Shadow(
                              // topLeft
                              offset: Offset(-1, 1),
                              color: Color.fromARGB(255, 200, 87, 12)),
                          Shadow(
                              // topCenter
                              offset: Offset(0, -1),
                              color: Color.fromARGB(255, 200, 87, 12)),
                          Shadow(
                              // right
                              offset: Offset(1, 0),
                              color: Color.fromARGB(255, 200, 87, 12)),
                          Shadow(
                              // left
                              offset: Offset(-1, 0),
                              color: Color.fromARGB(255, 200, 87, 12)),
                          Shadow(
                              // bottom
                              offset: Offset(0, 1),
                              color: Color.fromARGB(255, 200, 87, 12)),
                        ],
                        color: Color.fromARGB(255, 252, 230, 0),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                    alignment: Alignment.topCenter,
                    child: Text(
                      '20',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              // bottomLeft
                              offset: Offset(-1, -1),
                              color: Color.fromARGB(255, 251, 251, 249)),
                          Shadow(
                              // bottomRight
                              offset: Offset(1, -1),
                              color: Color.fromARGB(255, 251, 251, 249)),
                          Shadow(
                              // topRight
                              offset: Offset(1, 1),
                              color: Color.fromARGB(255, 251, 251, 249)),
                          Shadow(
                              // topLeft
                              offset: Offset(-1, 1),
                              color: Color.fromARGB(255, 251, 251, 249)),
                          Shadow(
                              // topCenter
                              offset: Offset(0, -1),
                              color: Color.fromARGB(255, 251, 251, 249)),
                          Shadow(
                              // right
                              offset: Offset(1, 0),
                              color: Color.fromARGB(255, 251, 251, 249)),
                          Shadow(
                              // left
                              offset: Offset(-1, 0),
                              color: Color.fromARGB(255, 251, 251, 249)),
                          Shadow(
                              // bottom
                              offset: Offset(0, 1),
                              color: Color.fromARGB(255, 251, 251, 249)),
                        ],
                        color: Color.fromARGB(255, 200, 87, 12),
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
