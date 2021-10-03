import 'package:flutter/material.dart';
import 'package:perfect_body/Workouts/widget/exercises_widget_AbsArm.dart';
import 'package:perfect_body/Workouts/widget/line_chart_widget.dart';

class HomePageAbsArm extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            ExercisesWidgetAbsArm(),
          ],
        ),
      );

  
}
