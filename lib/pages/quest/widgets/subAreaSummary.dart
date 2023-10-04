import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class SubAreaList extends StatelessWidget {
  const SubAreaList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('quest-sub-area')
          .orderBy('order')
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
            child: Text('No quests found.'),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.18,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: false,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String subAreaName = data['name'] ?? '';
                String subAreaImage = data['image'] ?? '';
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print(subAreaName);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                                image: AssetImage('assets/Backgrounds/' +
                                    subAreaImage +
                                    '.png'),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(16),
                                bottomLeft: Radius.circular(16),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.0),
                                  Colors.black.withOpacity(0.8),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
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
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  child: Text(
                                    subAreaName,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
