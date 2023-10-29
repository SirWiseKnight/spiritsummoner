import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit_summoner/domain/authentication/auth.dart';

class SpiritName extends StatefulWidget {
  final String docId;

  const SpiritName({Key? key, required this.docId}) : super(key: key);

  @override
  State<SpiritName> createState() => _SpiritNameState();
}

class _SpiritNameState extends State<SpiritName> {
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
        if (!snapshot.hasData) {
          return Center(
            child: Text('No name found.'),
          );
        }

        // Access the document data
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        String partnerName = data['name'] ?? '';
        int partnerLvl = data['level'] ?? 1;
        String partnerCoreType = data['coreType'] ?? '';
        return Container(
          width: 300,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 38,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '$partnerLvl',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 38,
                  child: Text(
                    partnerName,
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 38,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.asset(
                      'assets/Types/type' + partnerCoreType + '.png'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
