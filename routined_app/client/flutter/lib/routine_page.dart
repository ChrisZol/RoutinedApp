import 'package:flutter/material.dart';
import 'package:routined_app/routine_management/routine_management.dart';
import 'package:routined_app/task_page.dart';

class RoutinePage extends StatefulWidget{
  const RoutinePage({Key? key, required this.routine}) : super(key: key);
  
  final Routine routine;

  @override
  State<StatefulWidget> createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage>{

  void _pushTaskPage(Task task){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return TaskPage(task: task);
      }));
  }

  Widget _buildTaskList() => 
    ListView.separated(
      shrinkWrap: true,
      itemCount: widget.routine.tasks.length,
      itemBuilder: (context, index){
        var task = widget.routine.tasks[index];
    
        return ListTile(title: Text(task.name),
                        onTap: () => _pushTaskPage(task),);
      },
      separatorBuilder: (context, index){
    
        return const Divider();
      },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.routine.name),
      ),
      body: 
        Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(widget.routine.startTime.format(context) + ' - ' + widget.routine.endTime.format(context)),
              Flexible(
                child: _buildTaskList()
              ),
            ],
          ),
        ),
    );
  }
}