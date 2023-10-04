import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit_summoner/domain/authentication/auth.dart';

class PartnerStatsWIP extends StatelessWidget {
  const PartnerStatsWIP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('spirit-list')
          .where('uid', isEqualTo: AuthService().uid)
          .where('partner', isEqualTo: 'Y')
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
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              border: GradientBoxBorder(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.white.withOpacity(0.15),
                    Colors.white.withOpacity(0.01),
                    Colors.white.withOpacity(0.1),
                  ],
                ),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(23),
            ),
            height: MediaQuery.of(context).size.height * 0.2,
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
                String partnerINT = data['stat-int'] ?? '';
                return Container(
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
                                    style: GoogleFonts.montserrat(
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'DEF',
                                    style: GoogleFonts.montserrat(
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'MGK',
                                    style: GoogleFonts.montserrat(
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'MDF',
                                    style: GoogleFonts.montserrat(
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'SPD',
                                    style: GoogleFonts.montserrat(
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'INT',
                                    style: GoogleFonts.montserrat(
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
                                        value: (double.parse(partnerINT) / 100),
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          Colors.orange,
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
                                    partnerINT,
                                    style: GoogleFonts.montserrat(
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
