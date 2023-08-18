import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spirit_summoner/domain/authentication/auth.dart';

class PlayerInfo extends StatelessWidget {
  const PlayerInfo({Key? key}) : super(key: key);

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
            height: MediaQuery.of(context).size.height * 0.06,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String playerLevel = data['level'] ?? '';
                String playerName = data['username'] ?? '';
                String playerTitle = data['title'] ?? '';
                String playerReputation = data['reputation'] ?? '';

                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      playerName,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
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
                    Text(
                      playerTitle,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
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
                        color: Color.fromARGB(255, 80, 132, 5),
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
