import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:routined_app/routine_management/routine_data.dart';
import 'package:http/http.dart' as http;

class RoutinePage extends StatefulWidget {
  const RoutinePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  late Future<Routine> futureRoutine;

  @override
  void initState() {
    super.initState();
  }

  Future<Routine> fetchRoutine() async {
    var id = (ModalRoute.of(context)!.settings.arguments as Map)['id'];
    final response =
        await http.get(Uri.parse('http://127.0.0.1:3000/routine/$id'));

    if (response.statusCode == 200) {
      return Routine.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load routine');
    }
  }

  Widget _buildRoutineView(Routine routine) => Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(routine.startTime.format(context) +
                ' - ' +
                routine.endTime.format(context)),
            Flexible(child: _buildTaskList(routine)),
          ],
        ),
      );

  Widget _buildTaskList(Routine routine) => ListView.separated(
        shrinkWrap: true,
        itemCount: routine.tasks.length,
        itemBuilder: (context, index) {
          var task = routine.tasks[index];

          return ListTile(
            title: Text(task.name),
            onTap: () => Navigator.pushNamed(context, '/task',
                arguments: {'id': task.id}),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<Routine>(
            future: fetchRoutine(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _buildRoutineView(snapshot.data!);
              }
              return const Text('Routine not found');
            }));
  }
}
