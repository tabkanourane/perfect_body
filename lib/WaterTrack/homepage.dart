import 'package:flutter/material.dart';
import 'package:perfect_body/WaterTrack/global_blocs/app_bloc.dart';
import 'package:perfect_body/WaterTrack/home/page_container.dart';
import 'package:provider/provider.dart';
import 'package:perfect_body/models/user.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      final appBloc = Provider.of<AppBloc>(context, listen: false);
      await appBloc.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = Provider.of<AppBloc>(context).userBloc;
    return StreamBuilder<User>(
      stream: userBloc.outUser,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text(
                snapshot.error.toString(),
              ),
            ),
          );
        } else if (snapshot.hasData) {
          final user = snapshot.data;
          return PageContainer(user: user);
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
