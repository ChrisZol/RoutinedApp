import 'package:flutter/material.dart';
import 'package:routined_app/routine_management/routine_management.dart';

class TaskPage extends StatefulWidget{
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage>{
  late Future<Task> task;

  Widget _buildTaskView(Task task){
    return Column(
      children: [
        Container(child: const Text('Description'), padding: const EdgeInsets.all(10.0),),
        Container(child: Text(task.description), padding: const EdgeInsets.all(10.0),),
        Container(child: const Text('Duration'), padding: const EdgeInsets.all(10.0),),
        Container(child: Text('${task.duration} s'), padding: const EdgeInsets.all(10.0),)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: FutureBuilder<Task>(
          builder: 
          (context, snapshot)
          {
            if (snapshot.hasData){
              return _buildTaskView(snapshot.data!);
            }
            return const Text('Task not found.');
          })
      ),
    );
  }
}