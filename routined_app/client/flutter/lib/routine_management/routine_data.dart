import 'dart:convert';

import 'package:flutter/material.dart';

class Routine {
  final int id;
  final String name;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final List<Task> tasks;

  const Routine({
    required this.id,
    required this.name,
    required this.startTime,
    required this.endTime,
    this.tasks = const [],
  });

  factory Routine.fromJson(Map<String, dynamic> json) {
    return Routine(
      id: json['routine_id'],
      name: json['name'],
      startTime: json['start_time'] ?? const TimeOfDay(hour: 0, minute: 0),
      endTime: json['end_time'] ?? const TimeOfDay(hour: 0, minute: 0),
    );
  }

  Map toJson() => {
        'routine_id': id,
        'name': name,
        'start_time': startTime,
        'end_time': endTime,
        'tasks': jsonEncode(tasks)
      };
}

class Task {
  final int id;
  final String name;
  final String description;
  final int duration;

  const Task(
      {required this.id,
      required this.name,
      this.description = '',
      this.duration = 0});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['task_id'],
      name: json['name'],
      description: json['description'],
      duration: json['duration'],
    );
  }

  Map toJson() => {
        'task_id': id,
        'name': name,
        'description': description,
        'duration': duration,
      };
}
