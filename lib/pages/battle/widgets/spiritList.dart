import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit_summoner/domain/authentication/auth.dart';

class SpiritList extends StatelessWidget {
  const SpiritList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(AuthService().uid)
          .collection('spirit-list')
          //.orderBy('last_updt_ts', descending: true)
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
        return Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.29,
              child: ListView(
                shrinkWrap: false,
                padding: EdgeInsets.only(
                  top: 8.0,
                  left: 8.0,
                  right: 8.0,
                ),
                children: snapshot.data!.docs.map(
                  (DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    String docId = document.id;
                    String spiritName = data['name'] ?? '';
                    String spiritNickname = data['nickname'] ?? '';
                    int spiritIndex = data['index'] ?? 1;
                    String spiritDeviant = data['deviant'] ?? '';
                    String spiritType = data['coreType'] ?? '';
                    int spiritLevel = data['level'] ?? 1;
                    double spiritATK = data['attack'].toDouble() ?? 1;
                    double spiritDEF = data['defense'].toDouble() ?? 1;
                    double spiritMGK = data['magicAttack'].toDouble() ?? 1;
                    double spiritMDF = data['magicDefense'].toDouble() ?? 1;
                    double spiritSPD = data['speed'].toDouble() ?? 1;
                    double spiritINT = data['intelligence'].toDouble() ?? 1;
                    int spiritStatTotal = (spiritATK.round().round() +
                            spiritDEF.round() +
                            spiritMGK.round().round() +
                            spiritMDF.round().round() +
                            spiritSPD.round().round() +
                            spiritINT.round().round())
                        .round();
                    double spiritAttackTotal = spiritATK / spiritStatTotal;
                    double spiritDefenseTotal = spiritDEF / spiritStatTotal;
                    double spiritMagicAttackTotal = spiritMGK / spiritStatTotal;
                    double spiritMagicDefenseTotal =
                        spiritMDF / spiritStatTotal;
                    double spiritSpeedTotal = spiritSPD / spiritStatTotal;
                    double spiritIntelligenceTotal =
                        spiritINT / spiritStatTotal;
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 4.0,
                        bottom: 4.0,
                        top: 8.0,
                      ),
                      child: GestureDetector(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.125,
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
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                      alignment: Alignment.center,
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/Backgrounds/bg' +
                                              spiritType +
                                              '.png'),
                                    ),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      width: 150,
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: double.infinity,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                image: DecorationImage(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'assets/Spirits/' +
                                                          '$spiritIndex' +
                                                          '_' +
                                                          spiritName +
                                                          spiritDeviant +
                                                          '.png'),
                                                ),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  spiritName,
                                                  style: GoogleFonts.montserrat(
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
                                                  'Lvl $spiritLevel',
                                                  style: GoogleFonts.montserrat(
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
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.23),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.0375,
                                                height: double.infinity,
                                                child: RotatedBox(
                                                  quarterTurns: -1,
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.0375,
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height:
                                                              double.infinity,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            child:
                                                                LinearProgressIndicator(
                                                              value: 0,
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    179,
                                                                    23,
                                                                    12),
                                                              ),
                                                              backgroundColor:
                                                                  Colors.white
                                                                      .withOpacity(
                                                                          0.23),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height:
                                                              double.infinity,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            child:
                                                                LinearProgressIndicator(
                                                              value:
                                                                  spiritAttackTotal,
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                Colors.red,
                                                              ),
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.0375,
                                                height: double.infinity,
                                                child: RotatedBox(
                                                  quarterTurns: -1,
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.0375,
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height:
                                                              double.infinity,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            child:
                                                                LinearProgressIndicator(
                                                              value: 0,
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                Color.fromARGB(
                                                                    255,
                                                                    12,
                                                                    59,
                                                                    179),
                                                              ),
                                                              backgroundColor:
                                                                  Colors.white
                                                                      .withOpacity(
                                                                          0.23),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height:
                                                              double.infinity,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            child:
                                                                LinearProgressIndicator(
                                                              value:
                                                                  spiritDefenseTotal,
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                Colors.blue,
                                                              ),
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.0375,
                                                height: double.infinity,
                                                child: RotatedBox(
                                                  quarterTurns: -1,
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.0375,
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height:
                                                              double.infinity,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            child:
                                                                LinearProgressIndicator(
                                                              value: 0,
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                Color.fromARGB(
                                                                    255,
                                                                    104,
                                                                    12,
                                                                    179),
                                                              ),
                                                              backgroundColor:
                                                                  Colors.white
                                                                      .withOpacity(
                                                                          0.23),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height:
                                                              double.infinity,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            child:
                                                                LinearProgressIndicator(
                                                              value:
                                                                  spiritMagicAttackTotal,
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                Colors.purple,
                                                              ),
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.0375,
                                                height: double.infinity,
                                                child: RotatedBox(
                                                  quarterTurns: -1,
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.0375,
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height:
                                                              double.infinity,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            child:
                                                                LinearProgressIndicator(
                                                              value: 0,
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                Color.fromARGB(
                                                                    255,
                                                                    31,
                                                                    179,
                                                                    12),
                                                              ),
                                                              backgroundColor:
                                                                  Colors.white
                                                                      .withOpacity(
                                                                          0.23),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height:
                                                              double.infinity,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            child:
                                                                LinearProgressIndicator(
                                                              value:
                                                                  spiritMagicDefenseTotal,
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                Colors
                                                                    .lightGreen,
                                                              ),
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.0375,
                                                height: double.infinity,
                                                child: RotatedBox(
                                                  quarterTurns: -1,
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.0375,
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height:
                                                              double.infinity,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            child:
                                                                LinearProgressIndicator(
                                                              value: 0,
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                Color.fromARGB(
                                                                    255,
                                                                    179,
                                                                    143,
                                                                    12),
                                                              ),
                                                              backgroundColor:
                                                                  Colors.white
                                                                      .withOpacity(
                                                                          0.23),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height:
                                                              double.infinity,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            child:
                                                                LinearProgressIndicator(
                                                              value:
                                                                  spiritSpeedTotal,
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                Colors.yellow,
                                                              ),
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.0375,
                                                height: double.infinity,
                                                child: RotatedBox(
                                                  quarterTurns: -1,
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.0375,
                                                    child: Stack(
                                                      children: [
                                                        Container(
                                                          height:
                                                              double.infinity,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            child:
                                                                LinearProgressIndicator(
                                                              value: 0,
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                Color.fromARGB(
                                                                    255,
                                                                    179,
                                                                    76,
                                                                    12),
                                                              ),
                                                              backgroundColor:
                                                                  Colors.white
                                                                      .withOpacity(
                                                                          0.23),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height:
                                                              double.infinity,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            child:
                                                                LinearProgressIndicator(
                                                              value:
                                                                  spiritIntelligenceTotal,
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                Colors.orange,
                                                              ),
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
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
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 55,
                                        width: 55,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            100.0,
                                          ),
                                          color: Colors.orange[900],
                                        ),
                                        child: PopupMenuButton(
                                          position: PopupMenuPosition.over,
                                          icon: Icon(
                                            FontAwesomeIcons.ellipsis,
                                            color: Colors.white,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                              child: Container(
                                                height: 40,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.orange[900],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '1',
                                                    style: GoogleFonts.bungee(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      shadows: [
                                                        Shadow(
                                                          // bottomLeft
                                                          offset:
                                                              Offset(-1, -1),
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
                                              value: 'Slot 1',
                                              onTap: () async {
                                                QuerySnapshot querySnap1 =
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection(
                                                            'spirit-list')
                                                        .where('uid',
                                                            isEqualTo:
                                                                AuthService()
                                                                    .uid)
                                                        .where('position',
                                                            isEqualTo: '1')
                                                        .get();

                                                if (querySnap1
                                                    .docs.isNotEmpty) {
                                                  QueryDocumentSnapshot doc1 =
                                                      querySnap1.docs[0];
                                                  DocumentReference docRef1 =
                                                      doc1.reference;
                                                  await docRef1.update(
                                                      {'position': 'NULL'});
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('spirit-list')
                                                      .doc(docId)
                                                      .update(
                                                          {'position': '1'});
                                                } else {
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('spirit-list')
                                                      .doc(docId)
                                                      .update(
                                                          {'position': '1'});
                                                }
                                              },
                                            ),
                                            PopupMenuItem(
                                              child: Container(
                                                height: 40,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.orange[900],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '2',
                                                    style: GoogleFonts.bungee(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      shadows: [
                                                        Shadow(
                                                          // bottomLeft
                                                          offset:
                                                              Offset(-1, -1),
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
                                              value: 'Slot 2',
                                              onTap: () async {
                                                QuerySnapshot querySnap2 =
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection(
                                                            'spirit-list')
                                                        .where('uid',
                                                            isEqualTo:
                                                                AuthService()
                                                                    .uid)
                                                        .where('position',
                                                            isEqualTo: '2')
                                                        .get();

                                                if (querySnap2
                                                    .docs.isNotEmpty) {
                                                  QueryDocumentSnapshot doc2 =
                                                      querySnap2.docs[0];
                                                  DocumentReference docRef2 =
                                                      doc2.reference;
                                                  await docRef2.update(
                                                      {'position': 'NULL'});
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('spirit-list')
                                                      .doc(docId)
                                                      .update(
                                                          {'position': '2'});
                                                } else {
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('spirit-list')
                                                      .doc(docId)
                                                      .update(
                                                          {'position': '2'});
                                                }
                                              },
                                            ),
                                            PopupMenuItem(
                                              child: Container(
                                                height: 40,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.orange[900],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '3',
                                                    style: GoogleFonts.bungee(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      shadows: [
                                                        Shadow(
                                                          // bottomLeft
                                                          offset:
                                                              Offset(-1, -1),
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
                                              value: 'Slot 3',
                                              onTap: () async {
                                                QuerySnapshot querySnap3 =
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection(
                                                            'spirit-list')
                                                        .where('uid',
                                                            isEqualTo:
                                                                AuthService()
                                                                    .uid)
                                                        .where('position',
                                                            isEqualTo: '3')
                                                        .get();

                                                if (querySnap3
                                                    .docs.isNotEmpty) {
                                                  QueryDocumentSnapshot doc3 =
                                                      querySnap3.docs[0];
                                                  DocumentReference docRef3 =
                                                      doc3.reference;
                                                  await docRef3.update(
                                                      {'position': 'NULL'});
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('spirit-list')
                                                      .doc(docId)
                                                      .update(
                                                          {'position': '3'});
                                                } else {
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('spirit-list')
                                                      .doc(docId)
                                                      .update(
                                                          {'position': '3'});
                                                }
                                              },
                                            ),
                                            PopupMenuItem(
                                              child: Container(
                                                height: 40,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.red[600],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Partner',
                                                    style: GoogleFonts.bungee(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      shadows: [
                                                        Shadow(
                                                          // bottomLeft
                                                          offset:
                                                              Offset(-1, -1),
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
                                              value: 'Partner',
                                              onTap: () async {
                                                QuerySnapshot querySnap4 =
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection(
                                                            'spirit-list')
                                                        .where('uid',
                                                            isEqualTo:
                                                                AuthService()
                                                                    .uid)
                                                        .where('partner',
                                                            isEqualTo: 'Y')
                                                        .get();

                                                if (querySnap4
                                                    .docs.isNotEmpty) {
                                                  QueryDocumentSnapshot doc4 =
                                                      querySnap4.docs[0];
                                                  DocumentReference docRef4 =
                                                      doc4.reference;
                                                  await docRef4
                                                      .update({'partner': 'N'});
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('spirit-list')
                                                      .doc(docId)
                                                      .update({'partner': 'Y'});
                                                } else {
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('spirit-list')
                                                      .doc(docId)
                                                      .update({'partner': 'Y'});
                                                }
                                              },
                                            ),
                                          ],
                                        ),
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
                            '/spirit_summary_page', // Replace with your route name
                            arguments:
                                docId, // Replace with the actual docId you want to pass
                          );
                        },
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
