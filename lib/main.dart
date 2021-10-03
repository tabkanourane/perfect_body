import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perfect_body/BMI/BMICalculatorScreen.dart';
import 'package:perfect_body/Fit-Screen.dart';
import 'package:perfect_body/WaterTrack/global_blocs/app_bloc.dart';
import 'package:perfect_body/WaterTrack/global_blocs/auth/auth.dart';
import 'package:perfect_body/WaterTrack/global_blocs/theme_changer.dart';
import 'package:perfect_body/models/user.dart';

import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Auth>(
          create: (_) => Auth(),
        ),
        Provider<AppBloc>(
          create: (_) => AppBloc(),
        ),
        ChangeNotifierProvider<ThemeChanger>(
          create: (_) => ThemeChanger(),
        ),
      ],
      child: FutureBuilder(
        // Replace the 3 second delay with your initialization code:
        future: Future.delayed(Duration(seconds: 5)),
        builder: (context, AsyncSnapshot snapshot) {
          // Show splash screen while waiting for app resources to load:
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(home: FitScreen());
          } else {
            // Loading is done return the app:
            // return Provider<AppBloc>(
            //   create: (context) => AppBloc(),
            // child:
            return MaterialApp(
              home: BMICalculatorScreen(),
            );
            // );
          }
        },
      ),
    );
  }
}
