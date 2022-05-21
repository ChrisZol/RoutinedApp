import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:routined_app/routine_management/routine_data.dart';
import 'package:http/http.dart' as http;

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  late Future<Task> futureTask;

  @override
  void initState() {
    var id = ModalRoute.of(context)?.settings.arguments as int;
    super.initState();
    futureTask = fetchTask(id);
  }

  Future<Task> fetchTask(int id) async {
    final response =
        await http.get(Uri.parse('https://localhost:3000/task/$id'));

    if (response.statusCode == 200) {
      return Task.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Widget _buildTaskView(Task task) {
    return Column(children: [
      Container(
        child: const Text('Description'),
        padding: const EdgeInsets.all(10.0),
      ),
      Container(
        child: Text(task.description),
        padding: const EdgeInsets.all(10.0),
      ),
      Container(
        child: const Text('Duration'),
        padding: const EdgeInsets.all(10.0),
      ),
      Container(
        child: Text('${task.duration} s'),
        padding: const EdgeInsets.all(10.0),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          margin: const EdgeInsets.all(20.0),
          child: FutureBuilder<Task>(builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildTaskView(snapshot.data!);
            }
            return const Text('Task not found.');
          })),
    );
  }
}
