import 'package:flutter/material.dart';
import 'package:perfect_body/Home/background-image.dart';
import 'package:perfect_body/widgets/palatte.dart';

class FitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 50,
                    child: Text(
                      'Make a Perfect ',
                      style: kHeading,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: Text(
                      'Body',
                      style: kHeading,
                    ),
                  ),
                ),
                SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
