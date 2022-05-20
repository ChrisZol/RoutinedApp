import 'dart:math';
import 'package:flutter/material.dart';
import 'routine_management/routine_management.dart';

class RoutinesOverviewPage extends StatefulWidget{
  const RoutinesOverviewPage({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() => _RoutinesOverviewPageState();
}

class _RoutinesOverviewPageState extends State<RoutinesOverviewPage>{
  Widget _buildRoutineList() => 
    ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return _getListItem(index);
      },
    );
  
  Widget _getListItem(index) => 
    Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: Card(
        child: _getListTile(index),
      ),
    );

    Widget _getListTile(int index) {
        var rng = Random();
        final taskLength = rng.nextInt(15);
        var tasks = <Task>[];

        for (int i = 0; i < taskLength; i++) {
          tasks.add(Task(i, 'Task ${i + 1}', 'desc', rng.nextInt(200)));
        }

        var routineTest = Routine(index, "Routine ${index + 1}", 
                                  TimeOfDay(hour: rng.nextInt(24), minute: rng.nextInt(59)), 
                                  TimeOfDay(hour: rng.nextInt(24), minute: rng.nextInt(59)), 
                                  tasks);
        return ListTile(subtitle: Text(routineTest.startTime.format(context)), 
                        title: Text(routineTest.name),
                        onTap: () => Navigator.pushNamed(context, '/routine/:${routineTest.id}'),);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Routines'),
      ),
      body: Center(
        child: _buildRoutineList()
        ),
    );
  }
}