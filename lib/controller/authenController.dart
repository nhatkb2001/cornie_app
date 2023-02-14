// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../screens/authentication/snackbar.dart';
import '../screens/navigation/navigation.dart';
import '../screens/navigation/navigation_user.dart';

FirebaseAuth auth = FirebaseAuth.instance;

Future registerUser(String email, String password, context) async {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  try {
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      final User? user = auth.currentUser;
      final uid = user?.uid;
      FirebaseFirestore.instance.collection("users").doc(uid).set({
        'fullName': '',
        'email': email,
        'username': '',
        "id": uid,
        'phonenumber': '',
        'gender': '',
        'dob': '',
        'role': 'member',
        'avatar': "https://i.imgur.com/YtZkAbe.jpg",
        'favoriteList': FieldValue.arrayUnion([]),
        'saveList': FieldValue.arrayUnion([]),
      }).then((signedInUser) => {
            print("successfully registered!"),
          });
    });
  } on FirebaseAuthException catch (e) {
    print(e.code);
    switch (e.code) {
      case "operation-not-allowed":
        showSnackBar(context, "Anonymous accounts are not enabled!", 'error');
        break;
      case "weak-password":
        showSnackBar(context, "Your password is too weak!", 'error');
        break;
      case "invalid-email":
        showSnackBar(context, "Your email is invalid, please check!", 'error');
        break;
      case "email-already-in-use":
        showSnackBar(context, "Email is used on different account!", 'error');
        break;
      case "invalid-credential":
        showSnackBar(context, "Your email is invalid, please check!", 'error');
        break;

      default:
        showSnackBar(context, "An undefined Error happened.", 'error');
    }
  }
}

// Sign-in
Future signInController(String email, String password, context) async {
  try {
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      print("successfully login!");
      final User? user = auth.currentUser;
      final uid = user?.uid;
      // print("Your current id is $uid");
      if (uid != null) {
        await Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => NavigationUser(
                      uid: uid,
                    )));
      }
    });
  } on FirebaseAuthException catch (e) {
    print(e.code);
    switch (e.code) {
      case "user-not-found":
        showSnackBar(
            context, "Your email is not found, please check!", 'error');
        break;
      case "wrong-password":
        showSnackBar(context, "Your password is wrong, please check!", 'error');
        break;
      case "invalid-email":
        showSnackBar(context, "Your email is invalid, please check!", 'error');
        break;
      case "user-disabled":
        showSnackBar(context, "The user account has been disabled!", 'error');
        break;
      case "too-many-requests":
        showSnackBar(
            context, "There was too many attempts to sign in!", 'error');
        break;
      case "operation-not-allowed":
        showSnackBar(context, "The user account are not enabled!", 'error');
        break;
      // // Preventing user from entering email already provided by other login method
      // case "account-exists-with-different-credential":
      //   showErrorSnackBar(context, "This account exists with a different sign in provider!");
      //   break;

      default:
        showSnackBar(context, "An undefined Error happened.", 'error');
    }
  }
}

//Sign-out
signOut(context) async {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: ((context) => Navigation())));
  await _firebaseAuth.signOut();
}
