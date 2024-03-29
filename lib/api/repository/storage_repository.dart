import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tobetoappv2/constants/collection_names.dart';

class StorageRepository {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadPhoto(File photoUrl) async {
// Upload işlemini gerçekleştirirken kullanıcı'nın bilgisini'de alalım.

    User? loggedInUser = _auth.currentUser!;
    print(loggedInUser);
// Fotoğrafı göndermeden önce referens verilmesi gerek:
    final reference = _firebaseStorage.ref().child('profileImages/${loggedInUser.uid}.png');

// .putFile(resmi yükleme işlemi)
// Resmi yükleme işlemi: ---> kullanıcıdan aldığımız image

    await reference.putFile(photoUrl);
// Yükleme işlemi tamamlandıktan sonra, alt dizindeki dosyanın indirme URL'sini alabilirsiniz:
// İndirme Url'ni  Firestore'a kaydetmek için alıyorum.

    final downloadUrl = await reference.getDownloadURL();
    print(downloadUrl);
// users --> koleksiyonuna ekleyebilirsin.
    // try {
    //   print("Başladı");
    //   await _firestore.collection(Collections.USERS).doc(loggedInUser.uid).update({
    //     'profilephoto': downloadUrl,
    //     "userId": loggedInUser.uid,
    //   });
    //   print("Bitti");
    // } catch (e) {
    //   print(e);
    // }
    return downloadUrl;
  }
}
