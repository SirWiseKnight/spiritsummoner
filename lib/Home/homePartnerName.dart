import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rxdart/rxdart.dart';
import 'package:spirit_summoner/Services/models.dart';
import 'package:spirit_summoner/Services/auth.dart';

class PartnerName extends StatefulWidget {
  const PartnerName({Key? key}) : super(key: key);

  @override
  State<PartnerName> createState() => _PartnerNameState();
}

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Retrieves a single spirit document
  Future<Spirit> getSpirit(String name) async {
    var ref = _db.collection('spirit').doc(name);
    var snapshot = await ref.get();
    var spirit = Spirit.fromJson(snapshot.data() ?? {});
    return spirit;
  }
}

Spirit spirit = Spirit(name: 'SpiritName');
String spiritName = spirit.name;

class _PartnerNameState extends State<PartnerName> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 32.0,
              right: 32.0,
            ),
            child: Text(
              spirit.name,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                shadows: <Shadow>[
                  Shadow(
                    color: Colors.black.withOpacity(0.7),
                    blurRadius: 1.0,
                    offset: Offset(
                      1,
                      1,
                    ),
                  )
                ],
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class partnerLevel extends StatelessWidget {
  const partnerLevel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Colors.white.withOpacity(0.6)),
        width: 100,
        height: 30,
        alignment: Alignment.center,
        child: Text(
          "Level 20",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
