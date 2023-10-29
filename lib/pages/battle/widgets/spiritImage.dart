import 'package:flutter/material.dart';
import 'package:spirit_summoner/config/animations/spiritBounce.dart'; // Import your custom BouncingImage widget if needed
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spirit_summoner/domain/authentication/auth.dart';

class SpiritImage extends StatefulWidget {
  final String docId;

  const SpiritImage({Key? key, required this.docId}) : super(key: key);

  @override
  _SpiritImageState createState() => _SpiritImageState();
}

class _SpiritImageState extends State<SpiritImage> {
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
            child: Text('No image found.'),
          );
        }

        // Access the document data
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        int spiritIndexNumber = data['index'] ?? 0;
        String spiritName = data['name'] ?? '';
        String deviant = data['deviant'] ?? '';

        // Build the widget with the image
        return Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.8,
                child: BouncingImage(
                  imageUrl: 'assets/Spirits/$spiritIndexNumber' +
                      '_' +
                      spiritName +
                      deviant +
                      '.png',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
