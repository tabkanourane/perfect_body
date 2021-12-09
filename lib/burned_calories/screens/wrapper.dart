import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perfect_body/burned_calories/model/tracker.dart';
import 'package:perfect_body/burned_calories/model/user.dart';
import 'package:perfect_body/burned_calories/screens/main/bottomnav.dart';
import 'package:perfect_body/burned_calories/services/database.dart';
import 'package:provider/provider.dart';
import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<User>(context);

    // if (user == null) {
    //   return Authenticate();
    // } else {
    return FutureBuilder<FirebaseUser>(
      future: FirebaseAuth.instance.currentUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return Provider(
            create: (_)=>User(uid: snapshot.data.uid),
            child: StreamProvider<Tracker>.value(
              value: DatabaseService(uid: snapshot.data.uid).tracker,
              child: NavigationBar(),
            ),
          );

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // }
  }
}
