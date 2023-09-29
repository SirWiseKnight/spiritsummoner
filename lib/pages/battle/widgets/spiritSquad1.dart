import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit_summoner/domain/authentication/auth.dart';

class SpiritSquad1 extends StatelessWidget {
  const SpiritSquad1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('spirit-list')
          .where('uid', isEqualTo: AuthService().uid)
          .where('position', isEqualTo: '1')
          .get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text('No spirits found.'),
          );
        }
        return Container(
          height: MediaQuery.of(context).size.height * 0.275,
          child: Column(
            children: snapshot.data!.docs.map(
              (DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String spiritName = data['name'] ?? '';
                String spiritNickname = data['name-alt'] ?? '';
                String spiritIndex = data['index'] ?? '';
                String spiritDeviant = data['deviant'] ?? '';
                String spiritType = data['core-type'] ?? '';
                String spiritLevel = data['level'] ?? '';
                String docId = document.id;
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 4.0,
                    bottom: 4.0,
                    top: 8.0,
                  ),
                  child: GestureDetector(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.26,
                      width: MediaQuery.of(context).size.width * 0.3115,
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
                            width: MediaQuery.of(context).size.width * 0.0075,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                    alignment: Alignment.center,
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/Backgrounds/bg' +
                                        spiritType +
                                        '.png'),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.2965,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            alignment: Alignment.center,
                                            fit: BoxFit.fitHeight,
                                            image: AssetImage(
                                                'assets/Spirits/' +
                                                    spiritIndex +
                                                    '_' +
                                                    spiritName +
                                                    spiritDeviant +
                                                    '.png'),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              spiritNickname,
                                              style: GoogleFonts.poppins(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                shadows: [
                                                  Shadow(
                                                    // bottomLeft
                                                    offset: Offset(-1, -1),
                                                    color: Colors.white,
                                                  ),
                                                  Shadow(
                                                    // bottomRight
                                                    offset: Offset(1, -1),
                                                    color: Colors.white,
                                                  ),
                                                  Shadow(
                                                    // topRight
                                                    offset: Offset(1, 1),
                                                    color: Colors.white,
                                                  ),
                                                  Shadow(
                                                    // topLeft
                                                    offset: Offset(-1, 1),
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              'Lvl ' + spiritLevel,
                                              style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                shadows: [
                                                  Shadow(
                                                    // bottomLeft
                                                    offset: Offset(-1, -1),
                                                    color: Colors.white,
                                                  ),
                                                  Shadow(
                                                    // bottomRight
                                                    offset: Offset(1, -1),
                                                    color: Colors.white,
                                                  ),
                                                  Shadow(
                                                    // topRight
                                                    offset: Offset(1, 1),
                                                    color: Colors.white,
                                                  ),
                                                  Shadow(
                                                    // topLeft
                                                    offset: Offset(-1, 1),
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      'assets/Icons/type' +
                                                          spiritType +
                                                          '.png'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/spirit_summary_page',
                        arguments: docId,
                      );
                    },
                    onLongPress: () {
                      print('Invoke a way to change squad member.');
                    },
                  ),
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
