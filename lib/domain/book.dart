import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  Book(DocumentSnapshot doc) {
    documentID = documentID;
    title = doc['title'];
  }

  String documentID;
  String title;
  int id;
  DateTime createdAt;
}
