import 'package:flutter/material.dart';
import './workout.dart';
import './constants.dart';
import 'package:hustelhard/workout.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter/cupertino.dart';

class TailWorkoutList extends StatefulWidget {

  final List<Workout> addWorkouts;
  final Function deleteWorkout;
  TailWorkoutList(this.addWorkouts, this.deleteWorkout);

  @override
  _TailWorkoutListState createState() => _TailWorkoutListState();
}

class _TailWorkoutListState extends State<TailWorkoutList> {

  double n;
  void calculation(Workout wkot) {

    final enteredValue = int.parse(wkot.textController.text);
    if (enteredValue <= 0) {return;}
    setState(() {
       wkot.currentDoneReps = int.parse(wkot.textController.text);
       wkot.totalDone += wkot.currentDoneReps;
       wkot.numberOfRepsLeft = wkot.totalNumberOfReps - wkot.totalDone;
    });

  }

  double percent (int finished,int total) {
    
    setState(() {
      n=(finished/total);
      if(n>1){n=1;}
    });
    return n;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      child: SingleChildScrollView(
              child: Column(
              children: widget.addWorkouts.map((wkot){
                return Container(
                  height: 250,
                  width: 400,
                  child: Card(
                    color: ktailColor,                      //color
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 8,),
                        Text(wkot.numberOfRepsLeft.toString() + ' more to go',
                        style: TextStyle(
                          fontFamily: 'ShadowsIntoLight',
                          fontSize: 20,
                          
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w900
                        ),
                        ),         //add text style
                        
                        SizedBox(
                          height: 24,
                        )   ,    
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: 24,),
                            Text(wkot.title,style: TextStyle(fontFamily:'PermanentMarker',
                            fontSize: 25,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w900,
                            
                            ),),                   
                            SizedBox(width: 32,),
                            Container(
                              height: 60,
                              width: 120,
  
                              child: TextField(
                                controller: wkot.textController,
                                keyboardType: TextInputType.number,
                                onSubmitted: (_) => calculation,
                                decoration: InputDecoration(
                                  fillColor: kTextFieldBackground,                   //color
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: kTextFieldBorder            //color
                                      ),
                                    borderRadius: BorderRadius.all(Radius.circular(25)),
                                  ),
                                ),
                              ),
                            ),
                          SizedBox(
                            width: 24,
                          ),
                           FloatingActionButton(
                             backgroundColor: kCheckboxColor,                                            //color
                             child: Icon(CupertinoIcons.check_mark, size: 50,color: Colors.black,),      //color
                             //color: Colors.lightBlueAccent,
                             onPressed: (){calculation(wkot);}                                      //calculation function call
                           ),
                          ],
                        ),

                        SizedBox(height: 32,),
                        
                        Row(
                          children: <Widget>[
                            SizedBox(width: 24,),
                            Container(
                              height: 20,
                              width: 200,
                              child:LinearPercentIndicator(
                                width:200,
                                lineHeight: 25,
                                backgroundColor: kLineraProgressIndicatorBackgroundColor,         //color
                                progressColor: kLineraProgressIndicatorProgressColor,             //color
                                center: Text(
                                  ((wkot.totalDone/wkot.totalNumberOfReps)*100).toString()+'%',
                                  style: TextStyle(color:Colors.black,fontWeight: FontWeight.w900),                         //add text style
                                ),
                                percent: percent(wkot.totalDone, wkot.totalNumberOfReps),
                              ),
                            ),
                            SizedBox(width: 24,),
                             Container(
                               padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: kGoalColor,                                             //color
                            borderRadius: BorderRadius.circular(100),
                          ),
                          // height: 20,
                          // width: 50,
                          child: Column(
                            children: <Widget>[
                              Text(wkot.totalDone.toString(),style: TextStyle(fontWeight:FontWeight.w900),),                       //add text style
                              Text('____',style: TextStyle(fontWeight:FontWeight.w900),),                                      //add text style
                              Text(wkot.totalNumberOfReps.toString(),style: TextStyle(fontWeight:FontWeight.w900),),                     //add text style
                            ],
                          ),
                        ),
                        SizedBox(width: 32,),
                        IconButton(icon: Icon(Icons.delete),
                            color: Colors.red,
                             iconSize: 40,
                             onPressed: () {
                                  widget.deleteWorkout(wkot.title);
                              },
                        ),
                          ],
                        ),

                
                      ],
                    ),

                    ),
                );
              }).toList(),
            ),
      ),
    );
  }
}