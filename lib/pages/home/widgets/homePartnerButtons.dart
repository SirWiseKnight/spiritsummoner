import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PartnerActionButtons extends StatelessWidget {
  PartnerActionButtons({Key? key}) : super(key: key);

  final iconGradientColors = List<Color>.from([
    Color.fromARGB(255, 221, 147, 98),
    Color.fromARGB(255, 199, 87, 12),
  ]);

  final btnGradientColors = List<Color>.from([
    Color.fromARGB(255, 252, 236, 160),
    Color.fromARGB(255, 255, 221, 120),
    Color.fromARGB(255, 249, 150, 2),
  ]);

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
            GestureDetector(
              onTap: () {
                print("You pressed the Attacks Button!");
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.4,
                padding: const EdgeInsets.all(0.0),
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    radius: 1.5,
                    colors: [
                      Color.fromARGB(255, 252, 236, 160),
                      Color.fromARGB(255, 255, 221, 120),
                      Color.fromARGB(255, 249, 150, 2),
                    ],
                  ),
                  border: GradientBoxBorder(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 221, 147, 98),
                        Color.fromARGB(255, 199, 87, 12),
                      ],
                    ),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Container()),
                      Container(
                        child: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (rect) => LinearGradient(
                                  colors: iconGradientColors,
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight)
                              .createShader(rect),
                          child: Center(
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationZ(
                                -1 / 4,
                              ),
                              child: Container(
                                height: 50,
                                width: 50,
                                child: Icon(
                                  FontAwesomeIcons.meteor,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        alignment: Alignment.center,
                        child: Text(
                          'Attacks',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                  // bottomLeft
                                  offset: Offset(-1.5, -1.5),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // bottomRight
                                  offset: Offset(1.5, -1.5),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // topRight
                                  offset: Offset(1.5, 1.5),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // topLeft
                                  offset: Offset(-1.5, 1.5),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // topCenter
                                  offset: Offset(0, -1.5),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // right
                                  offset: Offset(1.5, 0),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // left
                                  offset: Offset(-1.5, 0),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // bottom
                                  offset: Offset(0, 1.5),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                            ],
                            color: Color.fromARGB(255, 102, 45, 1),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print("You pressed the Gear Button!");
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.4,
                padding: const EdgeInsets.all(0.0),
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    radius: 1.5,
                    colors: [
                      Color.fromARGB(255, 252, 236, 160),
                      Color.fromARGB(255, 255, 221, 120),
                      Color.fromARGB(255, 249, 150, 2),
                    ],
                  ),
                  border: GradientBoxBorder(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 221, 147, 98),
                        Color.fromARGB(255, 199, 87, 12),
                      ],
                    ),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Container()),
                      Container(
                        child: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (rect) => LinearGradient(
                                  colors: iconGradientColors,
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight)
                              .createShader(rect),
                          child: Center(
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationZ(
                                -1 / 4,
                              ),
                              child: Container(
                                height: 50,
                                width: 50,
                                child: Icon(
                                  FontAwesomeIcons.crown,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        alignment: Alignment.center,
                        child: Text(
                          'Gear',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                  // bottomLeft
                                  offset: Offset(-1.5, -1.5),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // bottomRight
                                  offset: Offset(1.5, -1.5),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // topRight
                                  offset: Offset(1.5, 1.5),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // topLeft
                                  offset: Offset(-1.5, 1.5),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // topCenter
                                  offset: Offset(0, -1.5),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // right
                                  offset: Offset(1.5, 0),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // left
                                  offset: Offset(-1.5, 0),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // bottom
                                  offset: Offset(0, 1.5),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                            ],
                            color: Color.fromARGB(255, 102, 45, 1),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print("You pressed the Talent Button!");
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.4,
                padding: const EdgeInsets.all(0.0),
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    radius: 1.5,
                    colors: [
                      Color.fromARGB(255, 252, 236, 160),
                      Color.fromARGB(255, 255, 221, 120),
                      Color.fromARGB(255, 249, 150, 2),
                    ],
                  ),
                  border: GradientBoxBorder(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 221, 147, 98),
                        Color.fromARGB(255, 199, 87, 12),
                      ],
                    ),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Container()),
                      Container(
                        child: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (rect) => LinearGradient(
                                  colors: iconGradientColors,
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight)
                              .createShader(rect),
                          child: Center(
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationZ(
                                -1 / 4,
                              ),
                              child: Container(
                                height: 50,
                                width: 50,
                                child: Icon(
                                  FontAwesomeIcons.dna,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        alignment: Alignment.center,
                        child: Text(
                          'Talent',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                  // bottomLeft
                                  offset: Offset(-1.5, -1.5),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // bottomRight
                                  offset: Offset(1.5, -1.5),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // topRight
                                  offset: Offset(1.5, 1.5),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // topLeft
                                  offset: Offset(-1.5, 1.5),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // topCenter
                                  offset: Offset(0, -1.5),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // right
                                  offset: Offset(1.5, 0),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // left
                                  offset: Offset(-1.5, 0),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                              Shadow(
                                  // bottom
                                  offset: Offset(0, 1.5),
                                  color: Color.fromARGB(255, 251, 251, 249)),
                            ],
                            color: Color.fromARGB(255, 102, 45, 1),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
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
