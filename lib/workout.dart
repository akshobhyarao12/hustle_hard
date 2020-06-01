import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class Workout {
  final String title;
  final num totalNumberOfReps;
  int currentDoneReps=0;
  int totalDone=0;
  int numberOfRepsLeft=10;
  final textController = TextEditingController();
  
  Workout({
    @required this.title,
    @required this.totalNumberOfReps,
    this.numberOfRepsLeft,
     });
}