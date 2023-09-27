import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

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
          String spiritLevel = data['level'] ?? '';
          String spiritATK = data['stat-atk'] ?? '';
          String spiritAttackBonus = data['stat-atk-bonus'] ?? '';
          String spiritDEF = data['stat-def'] ?? '';
          String spiritDefenseBonus = data['stat-def-bonus'] ?? '';
          String spiritMGK = data['stat-mgk'] ?? '';
          String spiritMagicAttackBonus = data['stat-mgk-bonus'] ?? '';
          String spiritMDF = data['stat-mdf'] ?? '';
          String spiritMagicDefenseBonus = data['stat-mdf-bonus'] ?? '';
          String spiritSPD = data['stat-spd'] ?? '';
          String spiritSpeedBonus = data['stat-spd-bonus'] ?? '';
          String spiritINT = data['stat-int'] ?? '';
          String spiritIntelligenceBonus = data['stat-int-bonus'] ?? '';
          int spiritStatTotal = ((double.parse(spiritATK)).round() +
                  (double.parse(spiritDEF)).round() +
                  (double.parse(spiritMGK)).round() +
                  (double.parse(spiritMDF)).round() +
                  (double.parse(spiritSPD)).round() +
                  (double.parse(spiritINT)).round()) *
              (2 - ((double.parse(spiritLevel).round()) / 100)).round();
          double spiritAttackTotal =
              (double.parse(spiritATK) / spiritStatTotal);
          double spiritAttackBonusTotal =
              spiritAttackTotal * double.parse(spiritAttackBonus);
          double spiritDefenseTotal =
              (double.parse(spiritDEF) / spiritStatTotal);
          double spiritDefenseBonusTotal =
              spiritDefenseTotal * double.parse(spiritDefenseBonus);
          double spiritMagicAttackTotal =
              (double.parse(spiritMGK) / spiritStatTotal);
          double spiritMagicAttackBonusTotal =
              spiritMagicAttackTotal * double.parse(spiritMagicAttackBonus);
          double spiritMagicDefenseTotal =
              (double.parse(spiritMDF) / spiritStatTotal);
          double spiritMagicDefenseBonusTotal =
              spiritMagicDefenseTotal * double.parse(spiritMagicDefenseBonus);
          double spiritSpeedTotal = (double.parse(spiritSPD) / spiritStatTotal);
          double spiritSpeedBonusTotal =
              spiritSpeedTotal * double.parse(spiritSpeedBonus);
          double spiritIntelligenceTotal =
              (double.parse(spiritINT) / spiritStatTotal);
          double spiritIntelligenceBonusTotal =
              spiritIntelligenceTotal * double.parse(spiritIntelligenceBonus);

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
                                  style: GoogleFonts.poppins(
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
                                        value: (double.parse(spiritATK) /
                                            spiritStatTotal),
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
                                spiritATK,
                                style: GoogleFonts.poppins(
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
                                  style: GoogleFonts.poppins(
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
                                        value: (double.parse(spiritDEF) /
                                            spiritStatTotal),
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
                                spiritDEF,
                                style: GoogleFonts.poppins(
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
                                  style: GoogleFonts.poppins(
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
                                        value: (double.parse(spiritMGK) /
                                            spiritStatTotal),
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
                                spiritMGK,
                                style: GoogleFonts.poppins(
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
                                  style: GoogleFonts.poppins(
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
                                        value: (double.parse(spiritMDF) /
                                            spiritStatTotal),
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
                                spiritMDF,
                                style: GoogleFonts.poppins(
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
                                  style: GoogleFonts.poppins(
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
                                        value: (double.parse(spiritSPD) /
                                            spiritStatTotal),
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
                                spiritSPD,
                                style: GoogleFonts.poppins(
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
                                  style: GoogleFonts.poppins(
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
                                        value: (double.parse(spiritINT) /
                                            spiritStatTotal),
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
                                spiritINT,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
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
                              style: GoogleFonts.poppins(
                                fontSize: 14,
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
