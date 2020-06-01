import 'package:flutter/material.dart';
import 'package:hustelhard/constants.dart';

class NewWorkout extends StatefulWidget {
  final Function addWkot;

  NewWorkout(this.addWkot);

  @override
  _NewWorkoutState createState() => _NewWorkoutState();
}

class _NewWorkoutState extends State<NewWorkout> {
  final titleController = TextEditingController();

  final totalRepsController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredValue = int.parse(totalRepsController.text);

    if(enteredTitle.isEmpty || enteredValue <= 0 ) {
      return;
    }

    widget.addWkot(
      enteredTitle,
      enteredValue,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ktailColor,
          child: Container(
        decoration: BoxDecoration(
          borderRadius:BorderRadius.only(topLeft:Radius.circular(25),topRight:Radius.circular(25)),
          color: kAlertDialogCOlor,
        ),
        
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField (
              decoration: InputDecoration( labelText: 'Workout',),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration( labelText: 'Total Reps'),
              controller: totalRepsController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),

            ),
            SizedBox(height: 8,),
          FlatButton(
            color: kFloatingActionButtonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ) ,
            onPressed: submitData, 
            child: Text('Add Workout'),
            ),
        ],),
      ),
    );
  }
}