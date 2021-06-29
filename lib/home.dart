import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title : Text("Home"),
      ),
      body:StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot){
          if(snapshot.hasData == false){
            return LoginWidget();
          }
          else{
            return Center(
              child: Column(
                children: [
                  Text("${snapshot.data!.displayName}님 환영합니다")
                ],
              ),
            );
        }
        },
      ),
    );
  }
}
