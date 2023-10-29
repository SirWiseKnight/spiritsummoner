import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit_summoner/domain/authentication/auth.dart';

class SpiritStats extends StatefulWidget {
  final String docId;

  const SpiritStats({Key? key, required this.docId}) : super(key: key);

  @override
  State<SpiritStats> createState() => _SpiritStatsState();
}

class _SpiritStatsState extends State<SpiritStats> {
  @override
  Widget build(BuildContext context) {
    final String docId = ModalRoute.of(context)?.settings.arguments as String;
    return FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(AuthService().uid)
            .collection('spirit-list')
            .doc(docId)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
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
          if (!snapshot.hasData || !snapshot.data!.exists) {
            // Check if document exists
            return Center(
              child: Text('No stats found.'),
            );
          }

          // Access the document data
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          int spiritLevel = data['level'] ?? 1;
          double spiritATK = data['attack'].toDouble() ?? 1.0;
          double spiritAttackBonus = 1.0;
          double spiritDEF = data['defense'].toDouble() ?? 1.0;
          double spiritDefenseBonus = 1.0;
          double spiritMGK = data['magicAttack'].toDouble() ?? 1.0;
          double spiritMagicAttackBonus = 1.0;
          double spiritMDF = data['magicDefense'].toDouble() ?? 1.0;
          double spiritMagicDefenseBonus = 1.0;
          double spiritSPD = data['speed'].toDouble() ?? 1.0;
          double spiritSpeedBonus = 1.0;
          double spiritINT = data['intelligence'].toDouble() ?? 1.0;
          double spiritIntelligenceBonus = 1.0;
          int spiritStatTotal = spiritATK.round() +
              spiritDEF.round() +
              spiritMGK.round() +
              spiritMDF.round() +
              spiritSPD.round() +
              spiritINT.round() * (2 - (spiritLevel / 100)).round();
          double spiritAttackTotal = (spiritATK / spiritStatTotal);
          double spiritAttackBonusTotal = spiritAttackTotal * spiritAttackBonus;
          double spiritDefenseTotal = (spiritDEF / spiritStatTotal);
          double spiritDefenseBonusTotal =
              spiritDefenseTotal * spiritDefenseBonus;
          double spiritMagicAttackTotal = (spiritMGK / spiritStatTotal);
          double spiritMagicAttackBonusTotal =
              spiritMagicAttackTotal * spiritMagicAttackBonus;
          double spiritMagicDefenseTotal = (spiritMDF / spiritStatTotal);
          double spiritMagicDefenseBonusTotal =
              spiritMagicDefenseTotal * spiritMagicDefenseBonus;
          double spiritSpeedTotal = (spiritSPD / spiritStatTotal);
          double spiritSpeedBonusTotal = spiritSpeedTotal * spiritSpeedBonus;
          double spiritIntelligenceTotal = (spiritINT / spiritStatTotal);
          double spiritIntelligenceBonusTotal =
              spiritIntelligenceTotal * spiritIntelligenceBonus;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              height: 215,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 209,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'ATK',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.018,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: LinearProgressIndicator(
                                        value: spiritAttackBonusTotal,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 152, 19, 9),
                                        ),
                                        backgroundColor:
                                            Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.018,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: LinearProgressIndicator(
                                        value: (spiritATK / spiritStatTotal),
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.red,
                                        ),
                                        backgroundColor:
                                            Colors.white.withOpacity(0.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              alignment: Alignment.center,
                              child: Text(
                                '$spiritATK',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'DEF',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.018,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: LinearProgressIndicator(
                                        value: spiritDefenseBonusTotal,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 12, 12, 104),
                                        ),
                                        backgroundColor:
                                            Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.018,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: LinearProgressIndicator(
                                        value: (spiritDEF / spiritStatTotal),
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.blue,
                                        ),
                                        backgroundColor:
                                            Colors.white.withOpacity(0.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              alignment: Alignment.center,
                              child: Text(
                                '$spiritDEF',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'MGK',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.018,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: LinearProgressIndicator(
                                        value: spiritMagicAttackBonusTotal,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 104, 12, 83),
                                        ),
                                        backgroundColor:
                                            Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.018,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: LinearProgressIndicator(
                                        value: (spiritMGK / spiritStatTotal),
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.purple,
                                        ),
                                        backgroundColor:
                                            Colors.white.withOpacity(0.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              alignment: Alignment.center,
                              child: Text(
                                '$spiritMGK',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'MDF',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.018,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: LinearProgressIndicator(
                                        value: spiritMagicDefenseBonusTotal,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 12, 104, 30),
                                        ),
                                        backgroundColor:
                                            Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.018,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: LinearProgressIndicator(
                                        value: (spiritMDF / spiritStatTotal),
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.green,
                                        ),
                                        backgroundColor:
                                            Colors.white.withOpacity(0.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              alignment: Alignment.center,
                              child: Text(
                                '$spiritMDF',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'SPD',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.018,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: LinearProgressIndicator(
                                        value: spiritSpeedBonusTotal,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 148, 150, 42),
                                        ),
                                        backgroundColor:
                                            Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.018,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: LinearProgressIndicator(
                                        value: (spiritSPD / spiritStatTotal),
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.yellow,
                                        ),
                                        backgroundColor:
                                            Colors.white.withOpacity(0.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              alignment: Alignment.center,
                              child: Text(
                                '$spiritSPD',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'INT',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.018,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: LinearProgressIndicator(
                                        value: spiritIntelligenceBonusTotal,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Color.fromARGB(255, 104, 63, 12),
                                        ),
                                        backgroundColor:
                                            Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.018,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: LinearProgressIndicator(
                                        value: (spiritINT / spiritStatTotal),
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.orange,
                                        ),
                                        backgroundColor:
                                            Colors.white.withOpacity(0.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              alignment: Alignment.center,
                              child: Text(
                                '$spiritINT',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2),
                        Container(
                          width: 188,
                          height: 35,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all<Color>(
                                  Colors.redAccent.shade100),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                            ),
                            onPressed: () {
                              print("You pressed the Edit Stats Button!");
                            },
                            child: Text(
                              'Edit',
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
