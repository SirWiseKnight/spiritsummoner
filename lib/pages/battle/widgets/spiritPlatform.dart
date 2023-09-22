import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spirit_summoner/domain/authentication/auth.dart';

class SpiritPlatform extends StatefulWidget {
  final String docId;

  const SpiritPlatform({Key? key, required this.docId}) : super(key: key);

  @override
  State<SpiritPlatform> createState() => _SpiritPlatformState();
}

class _SpiritPlatformState extends State<SpiritPlatform> {
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
            child: Text('No core type found.'),
          );
        }

        // Access the document data
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        String partnerPlatformType = data['core-type'] ?? '';
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            width: 400,
            child: Image.asset(
                'assets/Platforms/platform' + partnerPlatformType + '.webp'),
          ),
        );
      },
    );
  }
}
