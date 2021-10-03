import 'package:flutter/material.dart';
import 'package:perfect_body/WaterTrack/global_blocs/app_bloc.dart';
import 'package:perfect_body/WaterTrack/models/drink.dart';
import 'package:perfect_body/WaterTrack/widgets/buttons/circle_water_button.dart';
import 'package:perfect_body/WaterTrack/widgets/water_entry_tile.dart';
import 'package:perfect_body/WaterTrack/widgets/water_today_label.dart';
import 'package:provider/provider.dart';


class DrinkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drinkBloc = Provider.of<AppBloc>(context).drinkBloc;
    return Column(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              WaterTodayLabel(),
              CircleButton(),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: StreamBuilder<List<Drink>>(
            stream: drinkBloc.outDrinks,
            initialData: [],
            builder: (context, snapshot) {
              final drinks = snapshot.data;
              return ListView.builder(
                itemCount: drinks.length,
                itemBuilder: (context, index) {
                  final drink = drinks[index];
                  return WaterEntryTile(drink: drink);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
