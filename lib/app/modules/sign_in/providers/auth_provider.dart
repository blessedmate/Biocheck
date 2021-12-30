import 'package:biocheck_flutter/config.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends GetConnect {
  final url = ConfigEnvironments.getUrl();

  // login(String username, String password) async {
  //   final uri = Uri.https(url, 'Beta/users/login');
  //   final body = {'username': username, 'password': password};
  //   return await post(uri.toString(), body);
  // }

  Future<UserCredential?> login(email, password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
  }
}
