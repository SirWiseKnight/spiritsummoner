import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spirit_summoner/domain/authentication/auth.dart';

class PlayerEXP extends StatelessWidget {
  const PlayerEXP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(AuthService().uid)
            .collection('summoner-info')
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
          return Container(
            height: 20,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String playerEXPcurr = data['levelEXP'] ?? '';
                String playerEXPmax = data['levelEXPmax'] ?? '';

                return Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.005,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: LinearProgressIndicator(
                        value: (double.parse(playerEXPcurr) /
                            double.parse(playerEXPmax)),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.lightBlue,
                        ),
                        backgroundColor: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                      width: MediaQuery.of(context).size.width * 0.3,
                      alignment: Alignment.centerRight,
                      child: Text(
                        playerEXPcurr + "/" + playerEXPmax + " EXP",
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          shadows: <Shadow>[
                            Shadow(
                              color: Colors.black.withOpacity(0.7),
                              blurRadius: 1.0,
                              offset: Offset(
                                1,
                                1,
                              ),
                            )
                          ],
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          );
        });
  }
}
