import 'dart:ui';

class TaskModel
{
  final String title;
  final String description;
  final DateTime dateTime;
  final Color color;

  TaskModel({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.color
  });
}