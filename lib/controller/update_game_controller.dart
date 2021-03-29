import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateGameController {
  static void updateGame(DocumentSnapshot document) async {
    CollectionReference games = FirebaseFirestore.instance.collection('games');
    if (document.data()['isLiked'] == true) {
      games.doc(document.id).update({
        'isLiked': false,
        'likes': document.data()['likes'] - 1,
      });
    } else {
      games.doc(document.id).update({
        'isLiked': true,
        'likes': (document.data()['likes'] + 1),
      });
    }
  }
}
