import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class ShopList extends StatelessWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('shop-areas')
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
        return Container(
          height: MediaQuery.of(context).size.height * 0.35,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: false,
            padding: EdgeInsets.only(top: 8.0),
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              String shopName = data['name'] ?? '';
              return Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 8.0,
                  bottom: 8.0,
                ),
                child: GestureDetector(
                  onTap: () {
                    print(shopName + " Shop");
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              image: AssetImage('assets/Backgrounds/Shop' +
                                  shopName +
                                  '.png'),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
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
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
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
                                  shopName,
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
        );
      },
    );
  }
}
