import 'dart:convert';
import 'routine_data.dart';
import 'package:http/http.dart' as http;

Future<Routine> getRoutine(int id) async {
  final response =
      await http.get(Uri.parse('http://127.0.0.1:3000/routine/$id'));

  if (response.statusCode == 200) {
    return Routine.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load routine');
  }
}

Future<List<Routine>> getRoutines() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:3000/routines'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
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

Future<List<Task>> getTasks(int routine_id) async {
  final response = await http
      .get(Uri.parse('http://127.0.0.1:3000/routine/$routine_id/tasks'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> body = jsonDecode(response.body);

    return body
        .map(
          (dynamic item) => Task.fromJson(item),
        )
        .toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load routines');
  }
}

Future<Task> getTask(int id) async {
  final response = await http.get(Uri.parse('http://127.0.0.1:3000/task/$id'));

  if (response.statusCode == 200) {
    return Task.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load routine');
  }
}
