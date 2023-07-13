import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit_summoner/domain/authentication/auth.dart';

class PartnerHPWIP extends StatelessWidget {
  const PartnerHPWIP({Key? key}) : super(key: key);

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
            child: Text('No stats found.'),
          );
        }
        return Container(
          height: 36,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              String partnerHP = data['stat-hp'] ?? '';
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 300,
                  height: 18,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    partnerHP + ' HP',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
