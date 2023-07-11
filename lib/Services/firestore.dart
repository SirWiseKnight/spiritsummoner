import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:spirit_summoner/Services/models.dart';
import 'package:spirit_summoner/Services/auth.dart';

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

class SpiritName {
  final Spirit spirit;

  SpiritName(this.spirit);
}
