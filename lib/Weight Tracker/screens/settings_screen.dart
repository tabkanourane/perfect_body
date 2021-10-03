import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:meta/meta.dart';
import 'package:perfect_body/Weight%20Tracker/logic/actions.dart';
import 'package:perfect_body/Weight%20Tracker/logic/redux_state.dart';

@immutable
class SettingsPageViewModel {
  final String unit;
  final Function(String) onUnitChanged;

  const SettingsPageViewModel({this.unit, this.onUnitChanged});
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<ReduxState, SettingsPageViewModel>(
        converter: (store) {
      return SettingsPageViewModel(
        unit: store.state.unit,
        onUnitChanged: (newUnit) => store.dispatch(SetUnitAction(newUnit)),
      );
    }, builder: (context, viewModel) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: _unitView(context, viewModel),
            ),
//            ProfileView(),
          ],
        ),
      );
    });
  }

  Row _unitView(BuildContext context, SettingsPageViewModel viewModel) {
    return Row(
      children: <Widget>[
        Expanded(
            child: Text(
          "Unit",
          style: Theme.of(context).textTheme.headline1,
        )),
        DropdownButton<String>(
          key: const Key('UnitDropdown'),
          value: viewModel.unit,
          items: <String>["kg", "lbs"].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newUnit) => viewModel.onUnitChanged(newUnit),
        ),
      ],
    );
  }
}
