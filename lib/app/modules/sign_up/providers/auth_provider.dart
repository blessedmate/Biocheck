import 'package:biocheck_flutter/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends GetConnect {
  final url = ConfigEnvironments.getUrl();

  signUp(email, password, specialty, hospital, name) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      final docRef = users.doc(userCredential.user?.uid);
      await docRef.set({
        "email": email,
        "imageUrl": "",
        "hospital": {"id": hospital, "name": hospital},
        "name": name,
        "specialty": specialty
      });
      docRef.collection('history');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
