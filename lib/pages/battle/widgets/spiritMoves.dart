import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit_summoner/domain/authentication/auth.dart';

class SpiritMoves extends StatefulWidget {
  final String docId;

  const SpiritMoves({Key? key, required this.docId}) : super(key: key);

  @override
  State<SpiritMoves> createState() => _SpiritMovesState();
}

class _SpiritMovesState extends State<SpiritMoves> {
  @override
  Widget build(BuildContext context) {
    final String docId = ModalRoute.of(context)?.settings.arguments as String;
    return FutureBuilder<DocumentSnapshot>(
      future:
          FirebaseFirestore.instance.collection('spirit-list').doc(docId).get(),
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
            child: Text('No moves found.'),
          );
        }

        // Access the document data
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        String partnerATK1 = data['attack1name'] ?? '';
        String partnerATK1Type = data['attack1type'] ?? '';
        String partnerATK1Power = data['attack1power'] ?? '';
        String partnerATK2 = data['attack2name'] ?? '';
        String partnerATK2Type = data['attack2type'] ?? '';
        String partnerATK2Power = data['attack2power'] ?? '';
        String partnerATK3 = data['attack3name'] ?? '';
        String partnerATK3Type = data['attack3type'] ?? '';
        String partnerATK3Power = data['attack3power'] ?? '';
        String partnerATK4 = data['attack4name'] ?? '';
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
            height: 215,
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
                      SizedBox(height: 1),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                SizedBox(height: 1),
                Container(
                  width: 188,
                  height: 35,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all<Color>(
                          Colors.redAccent.shade100),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
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
      },
    );
  }
}
