import 'package:flutter/material.dart';

class Routine{
  final String name;
  final TimeOfDay startTime;
  final List<Task> tasks;

  const Routine(this.name, this.startTime, this.tasks);
}

class Task{
  final String name;
  final String description;
  final int duration;

  const Task(this.name, this.description, this.duration);
}