import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hustelhard/tail.dart';
import './constants.dart';
import './new_workout.dart';
import './workout.dart';
import './tail.dart';
void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final titleController = TextEditingController();
  final totalRepsController = TextEditingController();

  final List<Workout> _userWorkouts = [
    Workout(title: 'Pushups',totalNumberOfReps: 500,),
    Workout(title: 'Pullups', totalNumberOfReps: 100),
  ];
  
  void _addNewWorkout(String wkotTitle, num wkotTotalNumberOfReps){

    final newWkot = Workout(title: wkotTitle, totalNumberOfReps: wkotTotalNumberOfReps, numberOfRepsLeft:wkotTotalNumberOfReps);

    setState((){
        _userWorkouts.add(newWkot);
    });

  }

  void startAddNewWorkout(BuildContext ctx) {
    showModalBottomSheet(context: ctx, 
    backgroundColor: ktailColor,
    shape: RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(5))) ,
    builder: (_) {
      return GestureDetector (
        onTap: (){},
        behavior: HitTestBehavior.opaque,
        child: NewWorkout(_addNewWorkout));
      
    });
  }
  
  void _deleteWorkout(String title) {
    setState(() {
      _userWorkouts.removeWhere((wkot) {
          return wkot.title == title; 
      });
    });
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMainBackgroundColor,             //color
        
        appBar: AppBar(
          backgroundColor: kMainBackgroundColor,          //color
          bottomOpacity: 0,         
          toolbarOpacity: 0, 
          title: Center(
            child:
           Text('Hustle Hard',
          style: TextStyle(
            fontFamily: 'PermanentMarker',
            color: Colors.black,                           //color
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          ), 
        ),    
        ),      
        body: SingleChildScrollView(
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[ 
              SizedBox(
                height: 32,
              ), 
              //NewWorkout(_addNewWorkout),
            TailWorkoutList(_userWorkouts, _deleteWorkout),
          ],
          ),
        ),
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
         floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add,color: Colors.black,),    //color
            onPressed: () => startAddNewWorkout(context), 
            backgroundColor: kFloatingActionButtonColor,    //color
            )
      );
  }
}