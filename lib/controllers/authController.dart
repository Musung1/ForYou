import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import'package:get/get.dart';
import 'package:untitled/screens/app.dart';
import 'package:untitled/screens/home.dart';
import 'package:untitled/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/models/user.dart';



class AuthController extends GetxController{

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late Rx<User?> firebaseUser;
  RxBool isLoggedIn = false.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String usersCollection = "users";
  Rx<UserModel?> userModel = UserModel().obs;

void onReady(){
  super.onReady();

  firebaseUser = Rx<User?>(auth.currentUser);
  print(auth.currentUser);
  firebaseUser.bindStream(auth.userChanges());
  ever(firebaseUser, _setInitialScreen);
}
_setInitialScreen(User? user){
  if(user == null){
    Get.offAll(() => Login());
  }
  else{
    print(auth.currentUser!);
    Get.offAll(()=> Home());
  }
}
  void signUp() async {
    try {
      await auth
          .createUserWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user!.uid;
        _addUserToFirestore(_userId);
        _initializeUserModel(_userId);
        _clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }
  _addUserToFirestore(String userId) {
    firebaseFirestore.collection(usersCollection).doc(userId).set(
        {"id": userId, "email": email.text.trim()});
  }

  _initializeUserModel(String userId) async {
    userModel.value = await firebaseFirestore
        .collection(usersCollection)
        .doc(userId)
        .get()
        .then((doc) => UserModel.fromSnapshot(doc));
  }

  _clearControllers(){
    email.clear();
    password.clear();
  }
  void signOut() async {
    auth.signOut();
  }
}