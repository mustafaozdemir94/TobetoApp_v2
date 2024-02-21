// Burası kullanıcının datası eklendi mi? silindi mi? güncellendi mi? => firebasestore
// profile bilgilerini:::
// CRUD operations:

// CREATE ekleme add
// READ --> firestore da veri getirme get() / snapshot()
// UPDATE

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobetoappv2/constants/collection_names.dart';
import 'package:tobetoappv2/models/usermodel.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance; // kullanıcı id si almak için
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // create

  Future<void> addUsers(UserModel usermodel) async {
    final CollectionReference users = _firebaseFirestore.collection(Collections.USERS);
    usermodel.userId = _firebaseAuth.currentUser!.uid;
    await users.doc(usermodel.userId).set(usermodel.toMap());
  }

  //read
  Future fetchUsers(UserModel usermodel) async {
    final CollectionReference users = _firebaseFirestore.collection(Collections.USERS);
    usermodel.userId = _firebaseAuth.currentUser!.uid;
    final DocumentSnapshot documentSnapshot = await users.doc(usermodel.userId).get();
    if (documentSnapshot.exists) {
      return UserModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception("Kullanıcı Yok");
    }
  }

  // update

  Future<void> updateUsers(UserModel usermodel) async {
    final CollectionReference users = _firebaseFirestore.collection(Collections.USERS);
    usermodel.userId = _firebaseAuth.currentUser!.uid;
    await users.doc(usermodel.userId).update(usermodel.toMap());
  }
}
