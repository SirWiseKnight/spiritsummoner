import 'package:flutter/material.dart';
import 'package:spirit_summoner/Shared/Animations/spiritBounce.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spirit_summoner/Services/auth.dart';

class PartnerImageWIP extends StatelessWidget {
  const PartnerImageWIP({Key? key}) : super(key: key);

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
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 8.0),
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String partnerIndexNumber = data['indexNumber'] ?? '';
                String partnerName = data['name'] ?? '';

                return Container(
                  child: BouncingImage(
                      imageUrl: 'assets/Spirits/' +
                          partnerIndexNumber +
                          '_' +
                          partnerName +
                          '.png'),
                );
              }).toList(),
            ),
          );
        });
  }
}
