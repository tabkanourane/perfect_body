import 'package:flutter/material.dart';
import 'package:perfect_body/WaterTrack/global_blocs/auth/auth.dart';
import 'package:provider/provider.dart';

class AnonymousSignInButton extends StatelessWidget {
  const AnonymousSignInButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return ButtonTheme(
      minWidth: 224,
      height: 48,
      child: RaisedButton(
        onPressed: auth.signInAnonymously,
        color: Theme.of(context).cardColor,
        child: Text('Anonymous Sign in'),
      ),
    );
  }
}
