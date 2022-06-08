import 'dart:convert';
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
  //late List<Routine> routineList;

  @override
  void initState() {
    super.initState();
  }

  void addRoutine() async {
    final response = await http.post(
        Uri.parse('http://127.0.0.1:3000/routine/11'),
        body: jsonEncode(makeRoutine(11)));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to add routine');
    }
  }

  Future<List<Routine>> fetchRoutines() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:3000/routines'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.body);

      List<dynamic> body = jsonDecode(response.body);

      return body
          .map(
            (dynamic item) => Routine.fromJson(item),
          )
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load routines');
    }
  }

  void _showNewRoutineForm() {}

  Widget _buildRoutineList(List<Routine> routineList) => ListView.builder(
        itemCount: routineList.length,
        itemBuilder: (context, index) {
          return _getListItem(routineList[index]);
        },
      );

  Widget _getListItem(routine) => Container(
        margin: const EdgeInsets.only(top: 5.0),
        child: Card(
          child: _getListTile(routine),
        ),
      );

  Widget _getListTile(routine) {
    return ListTile(
      subtitle: Text(routine.startTime.format(context)),
      title: Text(routine.name),
      onTap: () => Navigator.pushNamed(context, '/routine',
          arguments: {'id': routine.id}),
    );
  }

  Routine makeRoutine(int index) {
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

    return Routine(
        id: index,
        name: "Routine ${index + 1}",
        startTime: TimeOfDay(hour: rng.nextInt(24), minute: rng.nextInt(59)),
        endTime: TimeOfDay(hour: rng.nextInt(24), minute: rng.nextInt(59)),
        tasks: tasks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Routines'),
      ),
      body: Builder(builder: (context) {
        return FutureBuilder(
            future: fetchRoutines(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                    child: _buildRoutineList(snapshot.data as List<Routine>));
              }
              return const Text('Routine not found');
            });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: addRoutine,
        tooltip: 'Add New Routine',
        child: const Icon(Icons.add),
      ),
    );
  }
}
