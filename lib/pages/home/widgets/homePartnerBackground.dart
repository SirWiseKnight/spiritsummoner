import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spirit_summoner/domain/authentication/auth.dart';

class PartnerBackgroundWIP extends StatelessWidget {
  const PartnerBackgroundWIP({Key? key}) : super(key: key);

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
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: false,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              String partnerPlatformType = data['core-type'] ?? '';
              return Container(
                alignment: Alignment.center,
                child: Image.asset(
                    'assets/Backgrounds/bg' + partnerPlatformType + '.png'),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
