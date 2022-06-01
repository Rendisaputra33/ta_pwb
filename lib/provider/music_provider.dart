import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MusicProvider extends ChangeNotifier {
  final FirebaseFirestore fire = FirebaseFirestore.instance;

  /// get music
  Stream<QuerySnapshot<Map<String, dynamic>>> get musicStream =>
      fire.collection('music').snapshots();

  Future<DocumentSnapshot<Map<String, dynamic>>?> getFavourites(
      String docID) async {
    try {
      var musicRef = fire.doc(docID);
      var result = await musicRef.get();
      return result;
    } on FirebaseException catch (e) {
      print(e.message);
      return null;
    }
  }
}
