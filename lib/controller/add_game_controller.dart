import 'dart:io';
import 'package:fidisys_game/models/game.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddGameController {
  static void addGame(Game game, BuildContext context) async {
    CollectionReference gamesRef =
        FirebaseFirestore.instance.collection('games');

    gamesRef.add({
      'gameName': game.name,
      'gameDesc': game.description,
      'gameURL': game.url,
      'minPlayers': game.minCount,
      'maxPlayers': game.maxCount,
      'gameCategory': game.category,
      'imageURL': game.image,
      'likes': game.likes,
      'isLiked': false
    }).then((value) {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Game added successfully!',
          ),
        ),
      );
    }).catchError((onError) {
      Navigator.of(context).pop();
      print(onError);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to add game. Please try again.',
          ),
        ),
      );
    });
  }

  static Future<String> uploadImage(File image) async {
    final Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(image.path.split('/').last);
    UploadTask uploadTask = firebaseStorageRef.putFile(image);
    TaskSnapshot storageSnapshot = await uploadTask;
    String downloadURL = await storageSnapshot.ref.getDownloadURL();

    return downloadURL;
  }
}
