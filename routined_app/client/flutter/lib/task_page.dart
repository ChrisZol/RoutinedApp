import 'package:flutter/material.dart';
import 'package:routined_app/routine_management/routine_management.dart';

class TaskPage extends StatefulWidget{
  const TaskPage({Key? key, required this.task}) : super(key: key);
  
  final Task task;

  @override
  State<StatefulWidget> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task.name),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(child: const Text('Description'), padding: const EdgeInsets.all(10.0),),
            Container(child: Text(widget.task.description), padding: const EdgeInsets.all(10.0),),
            Container(child: const Text('Duration'), padding: const EdgeInsets.all(10.0),),
            Container(child: Text('${widget.task.duration} s'), padding: const EdgeInsets.all(10.0),)
        ]),
      ),
    );
  }
}