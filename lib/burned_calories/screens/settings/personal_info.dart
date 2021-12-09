import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:perfect_body/burned_calories/model/tracker.dart';
import 'package:provider/provider.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var tracker = Provider.of<Tracker>(context);
    return Container(
      child: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            Column(
              children: [
                // this.weight,
                weightField(),
                // this.name,
                textField("name"),
                // this.sex,
                dropDown("sex"),
                // this.metric,
                dropDown("metric"),
                // this.height,
                numField("height"),
                // this.age,
                numField("age"),
                // this.activityLevel,
                dropDown("activityLevel"),
                // this.goal,
                dropDown("goal"),
                // this.personalNutrients,
                personalNutrients(),
              ],
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    if (_formkey.currentState.validate()) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Personal settings have changed."),
                        ),
                      );
                    }
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text("Personal settings have been set to default"),
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

  textField(String val) {}
  weightField() {}
  dropDown(String val) {}
  numField(String val) {}
  personalNutrients() {}
}
