import 'package:flutter/material.dart';
import 'package:routined_app/routine_page.dart';
import 'package:routined_app/routines_overview_page.dart';
import 'package:routined_app/task_page.dart';
import './home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routined Application',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomePage(title: 'Routined'),
      routes: <String, WidgetBuilder>{
        '/routines': (BuildContext context) => const RoutinesOverviewPage(),
        '/routine/:id':(context) => const RoutinePage(),
        '/task/:id' : (context) => const TaskPage()
      },
    );
  }
}
