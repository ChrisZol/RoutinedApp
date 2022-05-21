import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'routine_management/routine_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final String shownDate;
  late DateTime currentDate;
  final currentRoutines = <Routine>[];

  _HomePageState() {
    currentDate = DateTime.now();
    DateFormat format = DateFormat('MMMMEEEEd');
    shownDate = format.format(currentDate);
  }

  Widget _buildTodaysRoutineList() => ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
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
              startTime:
                  TimeOfDay(hour: rng.nextInt(24), minute: rng.nextInt(59)),
              endTime:
                  TimeOfDay(hour: rng.nextInt(24), minute: rng.nextInt(59)),
              tasks: tasks);
          return ListTile(
            subtitle: Text(routineTest.startTime.format(context)),
            title: Text(routineTest.name),
            onTap: () =>
                Navigator.pushNamed(context, '/routine/:${routineTest.id}'),
          );
        },
      );

  void _buttonPress() {
    currentDate.add(const Duration(days: 1));
    DateFormat format = DateFormat('MMMMEEEEd');
    shownDate = format.format(currentDate);
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
          children: <Widget>[
            const DrawerHeader(child: Text('Welcome!')),
            ListTile(
              title: const Text('My Routines'),
              onTap: () => Navigator.pushNamed(context, '/routines'),
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: _buttonPress,
                    icon: const Icon(Icons.arrow_left),
                  ),
                  Text(
                    shownDate,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  IconButton(
                    onPressed: _buttonPress,
                    icon: const Icon(Icons.arrow_right),
                  ),
                ],
              ),
            ),
            Expanded(child: _buildTodaysRoutineList()),
          ],
        ),
      ),
    );
  }
}
