import 'package:flutter/material.dart';
import 'package:perfect_body/Workouts/widget/exercises_widget_ButtLeg.dart';
import 'package:perfect_body/Workouts/widget/line_chart_widget.dart';

class HomePageButtLeg extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            ExercisesWidgetButtLeg(),
          ],
        ),
      );

  
}
