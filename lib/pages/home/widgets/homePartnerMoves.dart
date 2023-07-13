import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit_summoner/domain/authentication/auth.dart';

class PartnerMovesWIP extends StatelessWidget {
  const PartnerMovesWIP({Key? key}) : super(key: key);

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
            child: Text('No spirit found.'),
          );
        }
        return Container(
          height: 225,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              String partnerATK1 = data['attack1'] ?? '';
              String partnerATK1Type = data['attack1type'] ?? '';
              String partnerATK1Power = data['attack1power'] ?? '';
              String partnerATK2 = data['attack2'] ?? '';
              String partnerATK2Type = data['attack2type'] ?? '';
              String partnerATK2Power = data['attack2power'] ?? '';
              String partnerATK3 = data['attack3'] ?? '';
              String partnerATK3Type = data['attack3type'] ?? '';
              String partnerATK3Power = data['attack3power'] ?? '';
              String partnerATK4 = data['attack4'] ?? '';
              String partnerATK4Type = data['attack4type'] ?? '';
              String partnerATK4Power = data['attack4power'] ?? '';
              return Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  right: 8.0,
                  bottom: 8.0,
                ),
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black.withOpacity(0.4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 188,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 25,
                                      child: Image.asset('assets/Types/type' +
                                          partnerATK1Type +
                                          '.png'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        partnerATK1,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8.0,
                                        right: 8.0,
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 25,
                                        child: Text(
                                          partnerATK1Power,
                                          style: GoogleFonts.poppins(
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
                            ),
                            Container(
                              width: 188,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 25,
                                      child: Image.asset('assets/Types/type' +
                                          partnerATK2Type +
                                          '.png'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        partnerATK2,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8.0,
                                        right: 8.0,
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 25,
                                        child: Text(
                                          partnerATK2Power,
                                          style: GoogleFonts.poppins(
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
                            ),
                            Container(
                              width: 188,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 25,
                                      child: Image.asset('assets/Types/type' +
                                          partnerATK3Type +
                                          '.png'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        partnerATK3,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8.0,
                                        right: 8.0,
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 25,
                                        child: Text(
                                          partnerATK3Power,
                                          style: GoogleFonts.poppins(
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
                            ),
                            Container(
                              width: 188,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 25,
                                      child: Image.asset('assets/Types/type' +
                                          partnerATK4Type +
                                          '.png'),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        partnerATK4,
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8.0,
                                        right: 8.0,
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 25,
                                        child: Text(
                                          partnerATK4Power,
                                          style: GoogleFonts.poppins(
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
                            ),
                          ],
                        ),
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
                            print("You pressed the Edit Attacks Button!");
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
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
