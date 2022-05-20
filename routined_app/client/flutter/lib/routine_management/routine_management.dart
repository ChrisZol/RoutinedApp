import 'package:flutter/material.dart';

class Routine{
  final int id;
  final String name;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final List<Task> tasks;

  const Routine(this.id, this.name, this.startTime, this.endTime, this.tasks);
}

class Task{
  final int id;
  final String name;
  final String description;
  final int duration;

  const Task(this.id, this.name, this.description, this.duration);
}