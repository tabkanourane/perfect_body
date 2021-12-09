import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:perfect_body/burned_calories/model/tracker.dart';
import 'package:provider/provider.dart';

class MacroForm extends StatefulWidget {
  @override
  _MacroFormState createState() => _MacroFormState();
}

class _MacroFormState extends State<MacroForm> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var tracker = Provider.of<Tracker>(context);

    return Container(
      child: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(tracker.personalNutrients.containsKey("Carbs")
                    ? tracker.personalNutrients["carbs"].toString()
                    : "0"),
                macroTextFeild("Carbs"),
                macroTextFeild("Protein"),
                macroTextFeild("Fat"),
              ],
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    if (_formkey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Macros have changed."),
                        ),
                      );
                    }
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Macros have been set to default"),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget macroTextFeild(String name) {
    return Column(
      children: <Widget>[
        Text(name),
        TextFormField(
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter a number.';
            }
            return null;
          },
        ),
      ],
    );
  }
}
