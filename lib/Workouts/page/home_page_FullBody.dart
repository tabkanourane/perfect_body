import 'package:flutter/material.dart';
import 'package:perfect_body/Workouts/widget/exercises_widget_FullBody.dart';
import 'package:perfect_body/Workouts/widget/line_chart_widget.dart';

class HomePageFullBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            ExercisesWidgetFullBody(),
          ],
        ),
      );

  
}
