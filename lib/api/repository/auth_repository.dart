// Repository => Bu klasör veri kaynaklarına erişien ve veri işlemlerini gerçekleştiren depoları içerir.

// aslında biz repositories içerisende firestore istek atıp firestore dan gelen verileri de bloc içerisinde yönetiyoruz.

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // login user ---------------

  Future<void> loginUser(String password, String email) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  // create user ---------------

  Future<void> createUser(String password, String email, String username) async {
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  // signout  ---------------

  Future<void> signoutUser() async {
    await _auth.signOut();
  }
}
