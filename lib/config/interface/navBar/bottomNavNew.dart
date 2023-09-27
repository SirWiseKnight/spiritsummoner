import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spirit_summoner/pages/battle/view/battleHub.dart';
import 'package:spirit_summoner/pages/battle/view/spiritListPage.dart';
import 'package:spirit_summoner/pages/home/view/homeHub.dart';
import 'package:spirit_summoner/pages/quest/view/questHub.dart';
import 'package:spirit_summoner/pages/shop/view/shopHub.dart';

class BottomNavBubbles extends StatelessWidget {
  BottomNavBubbles({Key? key}) : super(key: key);

  final iconGradientColors = List<Color>.from([
    Color.fromARGB(255, 221, 147, 98),
    Color.fromARGB(255, 199, 87, 12),
  ]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.175,
                  width: MediaQuery.of(context).size.width * 0.175,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      radius: 0.6,
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
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                    icon: ShaderMask(
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
                            height: 40,
                            width: 40,
                            child: Icon(
                              FontAwesomeIcons.houseChimney,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  child: Text(
                    'Home',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                            // bottomLeft
                            offset: Offset(-1, -1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // bottomRight
                            offset: Offset(1, -1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // topRight
                            offset: Offset(1, 1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // topLeft
                            offset: Offset(-1, 1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // topCenter
                            offset: Offset(0, -1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // right
                            offset: Offset(1, 0),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // left
                            offset: Offset(-1, 0),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // bottom
                            offset: Offset(0, 1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                      ],
                      color: Color.fromARGB(255, 251, 251, 249),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.175,
                  width: MediaQuery.of(context).size.width * 0.175,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      radius: 0.6,
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
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuestScreen()),
                      );
                    },
                    icon: ShaderMask(
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
                            height: 40,
                            width: 40,
                            child: Icon(
                              FontAwesomeIcons.dungeon,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  child: Text(
                    'Quest',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                            // bottomLeft
                            offset: Offset(-1, -1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // bottomRight
                            offset: Offset(1, -1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // topRight
                            offset: Offset(1, 1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // topLeft
                            offset: Offset(-1, 1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // topCenter
                            offset: Offset(0, -1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // right
                            offset: Offset(1, 0),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // left
                            offset: Offset(-1, 0),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // bottom
                            offset: Offset(0, 1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                      ],
                      color: Color.fromARGB(255, 251, 251, 249),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.175,
                  width: MediaQuery.of(context).size.width * 0.175,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      radius: 0.6,
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
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BattleScreen()),
                      );
                    },
                    icon: ShaderMask(
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
                            height: 40,
                            width: 40,
                            child: Icon(
                              FontAwesomeIcons.shield,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  child: Text(
                    'Battle',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                            // bottomLeft
                            offset: Offset(-1, -1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // bottomRight
                            offset: Offset(1, -1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // topRight
                            offset: Offset(1, 1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // topLeft
                            offset: Offset(-1, 1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // topCenter
                            offset: Offset(0, -1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // right
                            offset: Offset(1, 0),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // left
                            offset: Offset(-1, 0),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // bottom
                            offset: Offset(0, 1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                      ],
                      color: Color.fromARGB(255, 251, 251, 249),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.175,
                  width: MediaQuery.of(context).size.width * 0.175,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      radius: 0.6,
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
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShopScreen()),
                      );
                    },
                    icon: ShaderMask(
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
                            height: 40,
                            width: 40,
                            child: Icon(
                              FontAwesomeIcons.piggyBank,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  child: Text(
                    'Shop',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                            // bottomLeft
                            offset: Offset(-1, -1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // bottomRight
                            offset: Offset(1, -1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // topRight
                            offset: Offset(1, 1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // topLeft
                            offset: Offset(-1, 1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // topCenter
                            offset: Offset(0, -1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // right
                            offset: Offset(1, 0),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // left
                            offset: Offset(-1, 0),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // bottom
                            offset: Offset(0, 1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                      ],
                      color: Color.fromARGB(255, 251, 251, 249),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.175,
                  width: MediaQuery.of(context).size.width * 0.175,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      radius: 0.6,
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
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SpiritListScreen()),
                      );
                    },
                    icon: ShaderMask(
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
                            height: 40,
                            width: 40,
                            child: Icon(
                              FontAwesomeIcons.envelopeOpenText,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  child: Text(
                    'Chat',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                            // bottomLeft
                            offset: Offset(-1, -1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // bottomRight
                            offset: Offset(1, -1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // topRight
                            offset: Offset(1, 1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // topLeft
                            offset: Offset(-1, 1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // topCenter
                            offset: Offset(0, -1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // right
                            offset: Offset(1, 0),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // left
                            offset: Offset(-1, 0),
                            color: Color.fromARGB(255, 80, 132, 5)),
                        Shadow(
                            // bottom
                            offset: Offset(0, 1),
                            color: Color.fromARGB(255, 80, 132, 5)),
                      ],
                      color: Color.fromARGB(255, 251, 251, 249),
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
