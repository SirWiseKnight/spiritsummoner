import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:spirit_summoner/pages/battle/view/battleScene.dart';

class SummonerList extends StatelessWidget {
  const SummonerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('users')
          //.where("parent", isEqualTo: "desertcavern")
          .orderBy('level', descending: true)
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
            child: Text('No users found.'),
          );
        }
        return Container(
          height: MediaQuery.of(context).size.height * 0.31,
          child: ListView(
            shrinkWrap: false,
            padding: EdgeInsets.only(top: 8.0),
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              String docId = document.id;
              String summonerName = data['username'] ?? '';
              int summonerLevel = data['level'] ?? '';
              return Padding(
                padding: const EdgeInsets.only(
                  right: 4.0,
                  bottom: 4.0,
                  top: 8.0,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.23),
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
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 300,
                        height: 52,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 12.0,
                            right: 12.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  summonerName,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Color.fromARGB(255, 113, 172, 255)
                                          .withOpacity(0.75),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(
                                        'Level ' + summonerLevel.toString(),
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BattleScene()),
                              );
                            },
                            child: Text(
                              'Battle',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
