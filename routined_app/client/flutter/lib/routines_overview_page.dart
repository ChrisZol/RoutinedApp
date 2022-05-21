import 'dart:math';
import 'package:flutter/material.dart';
import 'routine_management/routine_data.dart';
import 'package:http/http.dart' as http;

class RoutinesOverviewPage extends StatefulWidget {
  const RoutinesOverviewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RoutinesOverviewPageState();
}

class _RoutinesOverviewPageState extends State<RoutinesOverviewPage> {
  @override
  void initState() {
    super.initState();
    fetchRoutines();
  }

  void fetchRoutines() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/routines'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Widget _buildRoutineList() => ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return _getListItem(index);
        },
      );

  Widget _getListItem(index) => Container(
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
      tasks.add(Task(
          id: i,
          name: 'Task ${i + 1}',
          description: 'desc',
          duration: rng.nextInt(200)));
    }

    var routineTest = Routine(
        id: index,
        name: "Routine ${index + 1}",
        startTime: TimeOfDay(hour: rng.nextInt(24), minute: rng.nextInt(59)),
        endTime: TimeOfDay(hour: rng.nextInt(24), minute: rng.nextInt(59)),
        tasks: tasks);
    return ListTile(
      subtitle: Text(routineTest.startTime.format(context)),
      title: Text(routineTest.name),
      onTap: () => Navigator.pushNamed(context, '/routine',
          arguments: {'id': routineTest.id}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Routines'),
      ),
      body: Center(child: _buildRoutineList()),
    );
  }
}
