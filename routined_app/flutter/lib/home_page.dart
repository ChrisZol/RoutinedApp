import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:routined_app/routines_overview_page.dart';
import 'routine_management/routine_management.dart';
import './routine_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final String date;
  final currentRoutines = <Routine>[];

  _HomePageState(){
    DateTime now = DateTime.now();
    DateFormat format = DateFormat('MMMMEEEEd');
    date = format.format(now);
  }

  void _pushRoutineOverviewPage(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return const RoutinesOverviewPage();
      }));
  }

  void _pushRoutinePage(Routine routine){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return RoutinePage(routine: routine);
      }));
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget> [
            const DrawerHeader(child: Text('Welcome!')),
            ListTile(
              title: const Text('My Routines'),
              onTap: _pushRoutineOverviewPage,
            )
          ],
        ),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              date,
              style: Theme.of(context).textTheme.headline4,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  var rng = Random();
                  final taskLength = rng.nextInt(15);
                  var tasks = <Task>[];

                  for (int i = 0; i < taskLength; i++) {
                    tasks.add(Task('Task ${i + 1}', 'desc', rng.nextInt(200)));
                  }

                  var routineTest = Routine("Routine ${index + 1}", 
                                            TimeOfDay(hour: rng.nextInt(24), minute: rng.nextInt(59)), 
                                            tasks);
                  return ListTile(subtitle: Text(routineTest.startTime.format(context)), 
                                  title: Text(routineTest.name),
                                  onTap: () => _pushRoutinePage(routineTest),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}