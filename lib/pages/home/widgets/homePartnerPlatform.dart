import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spirit_summoner/domain/authentication/auth.dart';

class PartnerPlatformWIP extends StatelessWidget {
  const PartnerPlatformWIP({Key? key}) : super(key: key);

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
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              String partnerPlatformType = data['core-type'] ?? '';
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 400,
                  child: Image.asset('assets/Platforms/platform' +
                      partnerPlatformType +
                      '.webp'),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
