import 'package:flutter/material.dart';
import 'package:spirit_summoner/config/animations/spiritBounce.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spirit_summoner/domain/authentication/auth.dart';

class PartnerImageWIP extends StatelessWidget {
  const PartnerImageWIP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('spirit-list')
            .where('uid', isEqualTo: AuthService().uid)
            .where('partner', isEqualTo: 'Y')
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
              child: Text('No image found.'),
            );
          }
          return Container(
            child: Column(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String partnerIndexNumber = data['index'] ?? '';
                String partnerName = data['name'] ?? '';

                return Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.8,
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
