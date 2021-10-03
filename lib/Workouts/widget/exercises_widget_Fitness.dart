import 'package:flutter/material.dart';
import 'package:perfect_body/Workouts/WorkoutPage/Fitness.dart';
import 'package:perfect_body/Workouts/data/exercises_sets_Fitness.dart';
import 'package:perfect_body/Workouts/models/exercises_set.dart';
import 'package:perfect_body/Workouts/widget/exercise_set_widget.dart';

class ExercisesWidgetFitness extends StatefulWidget {
  @override
  _ExercisesWidgetFitnessState createState() => _ExercisesWidgetFitnessState();
}

class _ExercisesWidgetFitnessState extends State<ExercisesWidgetFitness> {
  ExerciseType selectedType = ExerciseType.low;

  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: const EdgeInsets.all(16),
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(height: 8),
              // Text(
              //   'Exercise',
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              // ),
              train(),
              SizedBox(height: 8),
              buildDifficultyLevel(),
              SizedBox(height: 8),
              buildWorkouts(),
            ],
          ),
        ),
      );

  Widget buildWorkouts() => GestureDetector(
        onHorizontalDragEnd: swipeFunction,
        child: Column(
          children: exerciseSets
              .where((element) => element.exerciseType == selectedType)
              .map(
                (exerciseSet) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ExerciseSetWidget(exerciseSet: exerciseSet)),
              )
              .toList(),
        ),
      );

  Widget buildDifficultyLevel() => Row(
        children: ExerciseType.values.map(
          (type) {
            final name = getExerciseName(type);
            final fontWeight =
                selectedType == type ? FontWeight.bold : FontWeight.normal;

            return Expanded(
              child: Center(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => setState(() => selectedType = type),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      name,
                      style: TextStyle(fontWeight: fontWeight, fontSize: 16),
                    ),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      );

  Widget train() => SafeArea(
        child: Container(
          child: Stack(
            children: [
              Container(
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/fitness.jpg',
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    ),
                    IconButton(
                      icon: new Icon(
                        Icons.arrow_back_ios,
                        color: Colors.blueGrey,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Fitness()),
                        );
                      },
                    ),
                    Positioned(
                      child: Text(
                        "Fitness",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      bottom: 30,
                      right: -230,
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  void swipeFunction(DragEndDetails dragEndDetails) {
    final selectedIndex = ExerciseType.values.indexOf(selectedType);
    final hasNext = selectedIndex < ExerciseType.values.length;
    final hasPrevious = selectedIndex > 0;

    setState(() {
      if (dragEndDetails.primaryVelocity < 0 && hasNext) {
        final nextType = ExerciseType.values[selectedIndex + 1];
        selectedType = nextType;
      }
      if (dragEndDetails.primaryVelocity > 0 && hasPrevious) {
        final previousType = ExerciseType.values[selectedIndex - 1];
        selectedType = previousType;
      }
    });
  }
}
