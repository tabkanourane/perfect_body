
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perfect_body/WaterTrack/global_blocs/app_bloc.dart';
import 'package:perfect_body/WaterTrack/global_blocs/auth/auth.dart';
import 'package:perfect_body/WaterTrack/global_blocs/theme_changer.dart';
import 'package:perfect_body/WaterTrack/root_page.dart';

import 'package:provider/provider.dart';

class WaterReminderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Auth>(
          create: (_) => Auth(),
          // Provider<Auth>(
          //   builder: (_) => Auth(),
        ),
        Provider<AppBloc>(
          create: (_) => AppBloc(),
          dispose: (_, appBloc) => appBloc.dispose(),
        ),
        ChangeNotifierProvider<ThemeChanger>(
          create: (_) => ThemeChanger(),
        ),
      ],
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Water Reminder',
      theme: themeChanger.theme,
      home: RootPage(),
    );
  }
}
