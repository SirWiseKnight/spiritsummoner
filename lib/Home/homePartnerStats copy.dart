import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit_summoner/Services/auth.dart';

class PartnerStatsWIP extends StatelessWidget {
  const PartnerStatsWIP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('spirit-partner')
          .where('uid', isEqualTo: AuthService().uid)
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
            child: Text('No stats found.'),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            bottom: 8.0,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String partnerATK = data['stat-atk'] ?? '';
                String partnerDEF = data['stat-def'] ?? '';
                String partnerMGK = data['stat-mgk'] ?? '';
                String partnerMDF = data['stat-mdf'] ?? '';
                String partnerSPD = data['stat-spd'] ?? '';
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.17,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'ATK',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
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
                                        value: (double.parse(partnerATK) / 100),
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.red,
                                        ),
                                        backgroundColor:
                                            Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  alignment: Alignment.center,
                                  child: Text(
                                    partnerATK,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'DEF',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
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
                                        value: (double.parse(partnerDEF) / 100),
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.blue,
                                        ),
                                        backgroundColor:
                                            Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  alignment: Alignment.center,
                                  child: Text(
                                    partnerDEF,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'MGK',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
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
                                        value: (double.parse(partnerMGK) / 100),
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.purple,
                                        ),
                                        backgroundColor:
                                            Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  alignment: Alignment.center,
                                  child: Text(
                                    partnerMGK,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'MDF',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
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
                                        value: (double.parse(partnerMDF) / 100),
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.green,
                                        ),
                                        backgroundColor:
                                            Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  alignment: Alignment.center,
                                  child: Text(
                                    partnerMDF,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'SPD',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
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
                                        value: (double.parse(partnerSPD) / 100),
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.yellow,
                                        ),
                                        backgroundColor:
                                            Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  alignment: Alignment.center,
                                  child: Text(
                                    partnerSPD,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.4,
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
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
