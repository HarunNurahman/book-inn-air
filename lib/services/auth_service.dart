import 'package:book_inn_air/models/user_model.dart';
import 'package:book_inn_air/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in method
  Future<UserModel> signIn({
    required String email,
    required String pass,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      UserModel userModel = await UserService().getUserbyID(
        userCredential.user!.uid,
      );
      return userModel;
    } catch (e) {
      throw e;
    }
  }

  // Sign up method
  Future<UserModel> signUp({
    required String email,
    required String pass,
    required String name,
    String hobby = '',
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        email: email,
        name: name,
        hobby: hobby,
        balance: 1000000,
      );

      await UserService().setUser(userModel);
      return userModel;
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }
}
