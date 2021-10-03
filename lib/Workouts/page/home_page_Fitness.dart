import 'package:flutter/material.dart';
import 'package:perfect_body/Workouts/widget/exercises_widget_Fitness.dart';

class HomePageFitness extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            ExercisesWidgetFitness(),
          ],
        ),
      );

  
}
