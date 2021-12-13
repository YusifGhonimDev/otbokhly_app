import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  void addData({username}) {
    String _userID = FirebaseAuth.instance.currentUser!.uid;
    Map<String, dynamic> _data = {
      "username": username,
      "favList": [],
    };
    _db.collection("userData").doc(_userID).set(_data);
  }

  Future<dynamic> getUsername() async {
    String _userID = FirebaseAuth.instance.currentUser!.uid;
    return await _db.collection("userData").doc(_userID).get().then((value) {
      return value.data()!["username"];
    });
  }

  Future<dynamic> getFavList() async {
    String _userID = FirebaseAuth.instance.currentUser!.uid;
    return await _db.collection("userData").doc(_userID).get().then((value) {
      return value.data()!["favList"];
    });
  }

  Future<bool> userExists(String username) async {
    return (await _db
        .collection("userData")
        .where("username", isEqualTo: username)
        .get()
        .then((value) => value.size > 0));
  }

  void addFavourites(favRecipe) {
    String _userID = FirebaseAuth.instance.currentUser!.uid;
    _db
        .collection("userData")
        .doc(_userID)
        .update({"favList": FieldValue.arrayUnion(favRecipe)});
  }

  void deleteFavourites() {
    String _userID = FirebaseAuth.instance.currentUser!.uid;
    _db.collection("userData").doc(_userID).update({"favList": ""});
  }
}
