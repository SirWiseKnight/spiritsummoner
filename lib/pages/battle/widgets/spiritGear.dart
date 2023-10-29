import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit_summoner/domain/authentication/auth.dart';

class SpiritGear extends StatefulWidget {
  final String docId;

  const SpiritGear({Key? key, required this.docId}) : super(key: key);

  @override
  State<SpiritGear> createState() => _SpiritGearState();
}

class _SpiritGearState extends State<SpiritGear> {
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
            child: Text('No gear found.'),
          );
        }

        // Access the document data
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        String partnerGear = data['gear'] ?? '';
        return Container(
          width: 200,
          height: 60,
          child: ElevatedButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all<Color>(
                  Colors.purpleAccent.shade100),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.purpleAccent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            onPressed: () {
              print("You pressed the Gear Button!");
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.crown,
                    color: Colors.white,
                    size: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Text(
                        partnerGear,
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
