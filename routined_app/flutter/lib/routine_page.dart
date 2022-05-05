import 'package:flutter/material.dart';
import 'package:routined_app/routine_management/routine_management.dart';

class RoutinePage extends StatefulWidget{
  const RoutinePage({Key? key, required this.routine}) : super(key: key);
  
  final Routine routine;

  @override
  State<StatefulWidget> createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.routine.name),
      ),
      body: 
        Center(
          child: ListView.separated(
            itemCount: widget.routine.tasks.length,
            itemBuilder: (context, index){
              var task = widget.routine.tasks[index];

              return ListTile(title: Text(task.name),);
            },
            separatorBuilder: (context, index){

              return const Divider();
            },
        ),
      ),
    );
  }
}