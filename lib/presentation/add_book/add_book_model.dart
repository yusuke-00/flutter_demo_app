import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/domain/book.dart';
import 'package:image_picker/image_picker.dart';

class AddBookModel extends ChangeNotifier {
  String bookTitle = "";
  File imageFile;
  bool isLoading = false;

  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future showImagePicker() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    imageFile = File(pickedFile.path);
    notifyListeners();
  }

  Future addBookToFirebase() async {
    if (bookTitle.isEmpty) {
      throw ("タイトルを入力してください");
    }
    final imageURL = await _uploadImage();

    FirebaseFirestore.instance.collection('books').add(
      {
        'title': bookTitle,
        'imageURL': imageURL,
        'createdAt': Timestamp.now(),
      },
    );
  }

  Future updateBook(Book book) async {
    final imageURL = await _uploadImage();

    final document =
        FirebaseFirestore.instance.collection('books').doc(book.documentID);
    await document.update(
      {
        'title': bookTitle,
        'imageURL': imageURL,
        'updateAT': Timestamp.now(),
      },
    );
  }

  Future<String> _uploadImage() async {
    final storage = FirebaseStorage.instance;
    return "https://pbs.twimg.com/media/En7cJh5VoAA0ShH?format=jpg&name=large";
  }
}
