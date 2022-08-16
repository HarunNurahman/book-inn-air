import 'package:book_inn_air/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userCollection.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'hobby': user.hobby,
        'balance': user.balance,
      });
    } catch (e) {
      throw e;
    }
  }
}
