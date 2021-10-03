import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:perfect_body/Weight%20Tracker/logic/actions.dart';
import 'package:perfect_body/Weight%20Tracker/logic/middleware.dart';
import 'package:perfect_body/Weight%20Tracker/logic/reducer.dart';
import 'package:perfect_body/Weight%20Tracker/logic/redux_state.dart';
import 'package:perfect_body/Weight%20Tracker/screens/main_page.dart';
import 'package:redux/redux.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class WeightPage extends StatelessWidget {
  
  final FirebaseAnalytics analytics = FirebaseAnalytics();
  final Store<ReduxState> store = Store<ReduxState>(reduce,
      initialState: ReduxState(
          entries: const [],
          unit: 'kg',
          removedEntryState: RemovedEntryState(hasEntryBeenRemoved: false),
          firebaseState: FirebaseState(),
          mainPageState: MainPageReduxState(hasEntryBeenAdded: false),
          weightEntryDialogState: WeightEntryDialogReduxState()),
      middleware: [middleware].toList());

  @override
  Widget build(BuildContext context) {
    store.dispatch(InitAction());
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Weight Tracker',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
        home: MainPage(title: "Weight Tracker", analytics: analytics),
      ),
    );
  }
}
