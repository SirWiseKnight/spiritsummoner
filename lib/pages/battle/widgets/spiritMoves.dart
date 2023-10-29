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
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(AuthService().uid)
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
            child: Text('No moves found.'),
          );
        }

        // Access the document data
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        List<dynamic> spiritMoves = data['moves'] as List<dynamic>;
        Map<String, dynamic> spiritMove1 =
            spiritMoves[0] as Map<String, dynamic>;
        Map<String, dynamic> spiritMove2 =
            spiritMoves[1] as Map<String, dynamic>;
        Map<String, dynamic> spiritMove3 =
            spiritMoves[2] as Map<String, dynamic>;
        Map<String, dynamic> spiritMove4 =
            spiritMoves[3] as Map<String, dynamic>;
        String partnerATK1 = spiritMove1['name'] ?? '';
        String partnerATK1Element = spiritMove1['element'] ?? '';
        int partnerATK1Power = spiritMove1['power'] ?? 0;
        String partnerATK2 = spiritMove2['name'] ?? '';
        String partnerATK2Element = spiritMove2['element'] ?? '';
        int partnerATK2Power = spiritMove2['power'] ?? 0;
        String partnerATK3 = spiritMove3['name'] ?? '';
        String partnerATK3Element = spiritMove3['element'] ?? '';
        int partnerATK3Power = spiritMove3['power'] ?? 0;
        String partnerATK4 = spiritMove4['name'] ?? '';
        String partnerATK4Element = spiritMove4['element'] ?? '';
        int partnerATK4Power = spiritMove4['power'] ?? 0;
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
                                    partnerATK1Element +
                                    '.png'),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  partnerATK1,
                                  style: GoogleFonts.montserrat(
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
                                    '$partnerATK1Power',
                                    style: GoogleFonts.montserrat(
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
                                    partnerATK2Element +
                                    '.png'),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  partnerATK2,
                                  style: GoogleFonts.montserrat(
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
                                    '$partnerATK2Power',
                                    style: GoogleFonts.montserrat(
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
                                    partnerATK3Element +
                                    '.png'),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  partnerATK3,
                                  style: GoogleFonts.montserrat(
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
                                    '$partnerATK3Power',
                                    style: GoogleFonts.montserrat(
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
                                    partnerATK4Element +
                                    '.png'),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  partnerATK4,
                                  style: GoogleFonts.montserrat(
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
                                    '$partnerATK4Power',
                                    style: GoogleFonts.montserrat(
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
                      style: GoogleFonts.montserrat(
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
        );
      },
    );
  }
}
