import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perfect_body/WaterTrack/global_blocs/app_bloc.dart';
import 'package:perfect_body/WaterTrack/global_blocs/auth/auth.dart';
import 'package:perfect_body/WaterTrack/home/home_page_setup.dart';
import 'package:perfect_body/WaterTrack/login/login_page.dart';
import 'package:provider/provider.dart';


/// This RootPage will display the home page
/// or the login page depending if we are
/// authenticated
class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    final notificationBloc = Provider.of<AppBloc>(context).notificationBloc;
    return StreamBuilder<FirebaseUser>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePageSetup();
        }
        notificationBloc.cancelNotifications();
        return LoginPage();
      },
    );
  }
}
